SHELL=/bin/bash -o pipefail

DOCKER ?= docker

.DEFAULT_GOAL := all

# FIXME standardize this build image, something with
# latex and pandoc deps
PANDOC_BUILDER_IMAGE ?= "quay.io/dalehamel/usdt-report-doc"
PWD ?= `pwd`

.PHONY: clean
clean:
	docker rm -f doc-builder || true
	rm -rf usdt-report-doc production-breakpoints-doc

.PHONY: usdt_report_doc/submodules
usdt_report_doc/submodules:
	cd docs/usdt-report-doc/ && git submodule init && git submodule update
	cd docs/usdt-report-doc/src/ruby-static-tracing && git submodule init && git submodule update
	cd docs/production-breakpoints-doc/ && git submodule init && git submodule update

.PHONY: _doc/builder/run
_doc/builder/run: clean usdt_report_doc/submodules
	mkdir -p usdt-report-doc production-breakpoints-doc
	${DOCKER} run -v ${PWD}/docs:/app \
           --name doc-builder \
           -d ${PANDOC_BUILDER_IMAGE} \
           /bin/sh -c 'sleep infinity'

.PHONY: production_breakpoints_doc/submodules
production_breakpoints_doc/submodules:
	cd docs/production-breakpoints-doc/ && git submodule init && git submodule update

docs/usdt-report-doc/output/doc.html: _doc/builder/run
	docker exec doc-builder /app/usdt-report-doc/scripts/build.sh

docs/production-breakpoints-doc/output/doc.html: _doc/builder/run
	docker exec doc-builder /app/production-breakpoints-doc/scripts/build.sh

production-breakpoints-doc/index.html: docs/production-breakpoints-doc/output/doc.html
	cp -r docs/production-breakpoints-doc/img production-breakpoints-doc/img
	cp docs/production-breakpoints-doc/output/doc.html production-breakpoints-doc/index.html

usdt-report-doc/index.html: docs/usdt-report-doc/output/doc.html
	cp -r docs/usdt-report-doc/img usdt-report-doc/img
	cp docs/usdt-report-doc/output/doc.html usdt-report-doc/index.html

.PHONY: travis
travis:
	rm -f docs/usdt-report-doc/src/bcc/tests/lua/spec

all: usdt-report-doc/index.html production-breakpoints-doc/index.html
