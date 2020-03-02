IMAGE = statworx/deka_data_science_portal:jupyterhub
# jupyterhub_proxy:0.1.0
CONTAINER = ds-proxy-jupyter
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

build:
	DOCKER_BUILDKIT=1 docker build -f $(THIS_FILE_DIR)/Dockerfile \
		-t $(IMAGE) \
		$(THIS_FILE_DIR)/../source

pull:
	docker pull statworx/deka_data_science_portal:jupyterhub

run_setup:
	docker run -d \
	    --name $(CONTAINER) \
		--net ${NETWORK} \
	    $(IMAGE)
	mkdir -p $(THIS_FILE_DIR)/../data/conda/envs
	docker cp $(CONTAINER):/opt/conda/envs/. $(THIS_FILE_DIR)/../data/conda/envs
	docker stop $(CONTAINER)
	docker rm $(CONTAINER)

run:
	docker run -d \
		--restart=unless-stopped \
	    --name $(CONTAINER) \
		--net ${NETWORK} \
		-v $(THIS_FILE_DIR)/../data/conda/envs:/opt/conda/envs \
	    -v $(THIS_FILE_DIR)/../data/admin:/home/admin \
        -v $(THIS_FILE_DIR)/../data/Devries:/home/Devries \
		-v $(THIS_FILE_DIR)/../data/Vittal:/home/Vittal \
        -v $(THIS_FILE_DIR)/../data/Dieringer:/home/Dieringer \
		-v $(THIS_FILE_DIR)/../data/Hamami:/home/Hamami \
        -v $(THIS_FILE_DIR)/../data/Korus:/home/Korus \
		-v $(THIS_FILE_DIR)/../data/Schmid:/home/Schmid \
        -v $(THIS_FILE_DIR)/../data/Vogt:/home/Vogt \
	    $(IMAGE)

stop:
	docker stop ${CONTAINER}

rm: stop
	docker rm ${CONTAINER}

package:
	docker save -o $(THIS_FILE_DIR)/../target/$(TAR) $(IMAGE)
	cd $(THIS_FILE_DIR)/.. && tar cfz target/$(PACKAGE) target/$(TAR) docker/Makefile  
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
