ENV_NAME := notebook-env

.PHONY: env lab help

help:
	@echo "make env   — create conda environment from environment.yml (run once)"
	@echo "make lab   — launch JupyterLab in the $(ENV_NAME) environment"

env:
	conda env create -f environment.yml

lab:
	conda run -n $(ENV_NAME) jupyter lab
