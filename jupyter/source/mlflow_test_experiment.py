# Run this code to test MLflow Connection and functionality (either copy code into notebook or run from terminal)

import mlflow
remote_server_uri = "http://ds-api-mlflow:5000/mlflow" # set MLflow server URI
mlflow.set_tracking_uri(remote_server_uri)
mlflow.set_experiment("/my-experiment-py")
with mlflow.start_run():
    mlflow.log_param("a", 1)
    mlflow.log_metric("b", 2)

# check artifact location
mlflow.get_artifact_uri()

# create test artifact
with open("hello.txt", "w") as f:
    f.write("Hello World!")

# log artifact
mlflow.log_artifact("hello.txt")