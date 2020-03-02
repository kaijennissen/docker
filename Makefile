#SUBDIRS := $(wildcard */.)
SUBDIRS = mlflow jupyter shiny_proxy proxy_reversed

rm_test:
		make -C jupyter/docker stop

run_all:
	    -make -C mlflow/docker run
		-make -C shiny_proxy/docker run
		-make -C proxy_reversed/docker run
		-make -C jupyter/docker run

stop_all:
		-make -C mlflow/docker stop
		-make -C shiny_proxy/docker stop
		-make -C proxy_reversed/docker stop
		-make -C jupyter/docker stop

rm_all:
		-make -C mlflow/docker rm
		-make -C shiny_proxy/docker rm
		-make -C proxy_reversed/docker rm
		-make -C jupyter/docker rm

pull_all:
	docker pull statworx/deka_data_science_portal:jupyterhub
	docker pull statworx/deka_data_science_portal:nginx
	docker pull statworx/deka_data_science_portal:rstudio
	docker pull statworx/deka_data_science_portal:mlflow
	docker pull statworx/deka_data_science_portal:shinyproxy
