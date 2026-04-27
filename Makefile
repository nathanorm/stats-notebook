ENV_NAME := notebook-env

.PHONY: env lab

env:
	conda env create -f environment.yml

lab:
	conda run -n $(ENV_NAME) jupyter lab
