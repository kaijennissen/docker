import mlflow
remote_server_uri = "http://ds-api-mlflow:5000/mlflow" # set to your server URI
mlflow.set_tracking_uri(remote_server_uri)
mlflow.set_experiment("//my-experiment-r")
mlflow.log_artifact("hello.txt")