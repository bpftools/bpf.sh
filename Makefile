SHELL=/bin/bash -o pipefail

DOCKER ?= docker

.DEFAULT_GOAL := all

PANDOC_BUILDER_IMAGE ?= "quay.io/dalehamel/pandoc-report-builder"
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
