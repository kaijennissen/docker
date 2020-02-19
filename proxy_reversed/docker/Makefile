IMAGE = nginx:1.17.5
CONTAINER = ds_proxy_reversed
NETWORK = data-science-net

REMOTE_FILE_SHARE =

# Name of exported image-tar
TAR := $(shell echo $(IMAGE) | sed 's/:/_/g' | sed 's/\//_/g')-image.tar

# Name of exported package
PACKAGE := $(shell echo $(IMAGE) | sed 's/:/_/g' | sed 's/\//_/g').tar.gz

THIS_FILE := $(realpath $(lastword $(MAKEFILE_LIST)))
THIS_FILE_DIR := $(shell dirname $(THIS_FILE))

check:
	docker-check image ${IMAGE}
	docker-check network ${NETWORK}

run:
	docker run -d \
		-p 443:443 \
		--restart=unless-stopped \
		-v $(THIS_FILE_DIR)/../source/resources/default.conf:/etc/nginx/conf.d/default.conf \
		-v $(THIS_FILE_DIR)/../source/resources/ssl:/etc/ssl \
		--name ${CONTAINER} \
		--net ${NETWORK} \
		${IMAGE}

stop:
	docker stop ${CONTAINER}

rm: stop
	docker rm ${CONTAINER}

package:
	docker save -o $(THIS_FILE_DIR)/../target/$(TAR) $(IMAGE)
	cd $(THIS_FILE_DIR)/.. && tar cfz target/$(PACKAGE) target/$(TAR) docker/Makefile source/
	rm $(THIS_FILE_DIR)/../target/$(TAR)

load:
	docker load -i $(THIS_FILE_DIR)/../target/$(TAR)

help:
	$(info Use `make check` to check if environment is ready)
	$(info Use `make build` to build image)
	$(info Use `make run` to start container)
	$(info Use `make stop` to stop container)
	$(info Use `make rm` to remove container)
	$(info Use `make package` to pack resources for deployment)
	$(info Use `make load` to load image at deployment environment)

