################################################################################

all: amd64-sdk

amd64-sdk: amd64-sdk/.done
release: sdk-release

################################################################################

amd64-sdk/.done: amd64-sdk/Dockerfile
	-docker rmi raphaelmeyer/amd64-sdk
	docker build -t raphaelmeyer/amd64-sdk amd64-sdk
	touch $@

################################################################################

sdk-release: check-tag amd64-sdk
	docker tag raphaelmeyer/amd64-sdk raphaelmeyer/amd64-sdk:$(tag)
	docker push raphaelmeyer/amd64-sdk:$(tag)

check-tag:
ifndef tag
	$(error "Must specify a tag with make release tag=TAG")
endif

################################################################################

clean:
	rm -rf amd64-sdk/.done
	-docker rmi raphaelmeyer/amd64-sdk

.PHONY: clean

