IMAGE = statworx/deka_data_science_portal:mlflow
# mlflow_api:0.1.0
CONTAINER = ds-api-mlflow
NETWORK = data-science-net

REMOTE_FILE_SHARE =

# Name of exported image-tar
TAR := $(shell echo $(IMAGE) | sed 's/:/_/g' | sed 's/\//_/g')-image.tar

# Name of exported package
PACKAGE := $(shell echo $(IMAGE) | sed 's/:/_/g' | sed 's/\//_/g').tar.gz

THIS_FILE := $(realpath $(lastword $(MAKEFILE_LIST)))
THIS_FILE_DIR := $(shell dirname $(THIS_FILE))

check:
	sudo docker-check image ${IMAGE}
	sudo docker-check network ${NETWORK}

build:
	DOCKER_BUILDKIT=1 sudo docker build -f $(THIS_FILE_DIR)/Dockerfile \
		-t $(IMAGE) \
		$(THIS_FILE_DIR)/../source

pull:
	sudo docker pull statworx/deka_data_science_portal:mlflow

run:
	sudo docker run -d \
		--restart=unless-stopped \
	    --name $(CONTAINER) \
		-e SCRIPT_NAME=/mlflow \
		--net ${NETWORK} \
		-v $(THIS_FILE_DIR)/../../artifacts:/artifacts \
		-v $(THIS_FILE_DIR)/../data/mlruns:/mlruns \
		$(IMAGE)

stop:
	sudo docker stop ${CONTAINER}

rm: stop
	sudo docker rm ${CONTAINER}

package:
	docker save -o $(THIS_FILE_DIR)/../target/$(TAR) $(IMAGE)
	cd $(THIS_FILE_DIR)/.. && tar cfz target/$(PACKAGE) target/$(TAR) docker/Makefile  source/
	rm $(THIS_FILE_DIR)/../target/$(TAR)

load:
	sudo docker load -i $(THIS_FILE_DIR)/../target/$(TAR)

help:
	$(info Use `make check` to check if environment is ready)
	$(info Use `make build` to build image)
	$(info Use `make run` to start container)
	$(info Use `make stop` to stop container)
	$(info Use `make rm` to remove container)
	$(info Use `make package` to pack resources for deployment)
	$(info Use `make load` to load image at deployment environment)

