.PHONY: build

build:
	docker buildx build --platform linux/amd64 -t i2bskn/golang-grpc .
