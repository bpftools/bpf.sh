SHELL=/bin/bash -o pipefail

DOCKER ?= docker

.DEFAULT_GOAL := all

PANDOC_BUILDER_IMAGE ?= "quay.io/dalehamel/pandoc-report-builder"
PWD ?= `pwd`

.PHONY: clean
clean:
	scripts/clean

.PHONY: submodules
submodules:
	git submodule update --init --recursive

.PHONY: docs/build
docs/build:
	scripts/build ${PANDOC_BUILDER_IMAGE}

# any hacks needed to easily build / publish on travis
.PHONY: travis
travis:
	scripts/tidy
	rm -f .gitignore

index.html:
	ln -sf index/index.html index.html

all: submodules docs/build index.html
