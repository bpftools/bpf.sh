SHELL=/bin/bash -o pipefail

DOCKER ?= docker

.DEFAULT_GOAL := all

PANDOC_BUILDER_IMAGE ?= "quay.io/dalehamel/usdt-report-doc"
PWD ?= `pwd`

.PHONY: clean
clean:
	docker rm -f usdt-report-doc || true
	rm -rf usdt-report-doc

.PHONY: usdt_report_doc/submodules
usdt_report_doc/submodules:
	cd docs/usdt-report-doc/ && git submodule init && git submodule update
	cd docs/usdt-report-doc/src/ruby-static-tracing && git submodule init && git submodule update

.PHONY: usdt_report_doc/builder/run
_usdt_report_doc/builder/run: clean usdt_report_doc/submodules
	mkdir -p usdt-report-doc
	${DOCKER} run -v ${PWD}/docs:/app \
           --name usdt-report-doc \
           -w /app/usdt-report-doc \
           -d ${PANDOC_BUILDER_IMAGE} \
           /bin/sh -c 'sleep infinity'

docs/usdt-report-doc/output/doc.html: _usdt_report_doc/builder/run
	rm -rf vendor
	docker exec usdt-report-doc ./scripts/build.sh

usdt-report-doc/index.html: docs/usdt-report-doc/output/doc.html
	rm -f docs/usdt-report-doc/src/bcc/tests/lua/spec
	cp -r docs/usdt-report-doc/img usdt-report-doc/img
	cp docs/usdt-report-doc/output/doc.html usdt-report-doc/index.html

all: usdt-report-doc/index.html
