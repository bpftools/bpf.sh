SHELL=/bin/bash -o pipefail

DOCKER ?= docker

.DEFAULT_GOAL := all

# FIXME standardize this build image, rename to "pandoc-report-builder" or something obvious
# containing the basic latex and pandoc deps to render doc output
PANDOC_BUILDER_IMAGE ?= "quay.io/dalehamel/usdt-report-doc"
DOCKER_BUILDER ?= "pandoc-report-builder"
PWD ?= `pwd`

.PHONY: clean
clean:
	docker rm -f ${DOCKER_BUILDER} || true
	scripts/clean

.PHONY: submodules
submodules:
	git submodule update --init --recursive

.PHONY: _doc/builder/run
_doc/builder/run: clean submodules
	mkdir -p usdt-report-doc production-breakpoints-doc
	${DOCKER} run -v ${PWD}/docs:/app \
           --name ${DOCKER_BUILDER} \
           -d ${PANDOC_BUILDER_IMAGE} \
           /bin/sh -c 'sleep infinity'

.PHONY: docs/build
docs/build: _doc/builder/run
	scripts/build ${DOCKER_BUILDER}

# any hacks needed to easily build / publish on travis
.PHONY: travis
travis:
	scripts/tidy
	rm -f .gitignore

index.html:
	ln -sf index-doc/index.html

all: docs/build index.html
