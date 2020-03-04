# Run this code to test MLflow Connection and functionality (either copy or create into user folder after login)

library(mlflow)
remote <- "http://ds-api-mlflow:5000/mlflow" # set MLflow server URI
experiment <- "/my-experiment-r"
mlflow_set_tracking_uri(remote)
mlflow_set_experiment(experiment)
mlflow_log_param("a", "1")

# - To store artifacts go to terminal and activate conda base environment:
#   conda activate base
# - Create/adjust log_artifacts.py (change experiment name and insert artifact name)
# - Create test artifact with e.g.:
#   echo "Hello World" > hello.txt
# - Run the python script:
#   python log_artifacts.py
