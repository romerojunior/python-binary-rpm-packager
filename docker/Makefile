TAG=latest
IMAGE=romerojnr/patchingui-agent

.PHONY: build
build:
	docker build --tag $(IMAGE):$(TAG) .

.PHONY: push
push: build
	docker push $(IMAGE):$(TAG)
