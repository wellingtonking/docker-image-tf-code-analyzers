# Quickly put together just to get started

IMAGE ?= tf-code-analyzers
REPO ?= wkng

GIT_HASH ?= $(shell git log --format="%h" -n 1)
TAG ?= ${GIT_HASH}

build:
	docker build --tag ${REPO}/${IMAGE}:${TAG} .

push:
	docker push ${REPO}/${IMAGE}:${TAG}
