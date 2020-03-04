pull_all:
	sudo docker pull docker.io/statworx/deka_data_science_portal:jupyterhub
	sudo docker pull docker.io/statworx/deka_data_science_portal:nginx
	sudo docker pull docker.io/statworx/deka_data_science_portal:rstudio
	sudo docker pull docker.io/statworx/deka_data_science_portal:mlflow
	sudo docker pull docker.io/statworx/deka_data_science_portal:shinyproxy
run_setup:
	-make -C jupyter/docker run_setup 

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

