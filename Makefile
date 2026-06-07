.PHONY: build up down logs env help

help:
	@echo "make env    — create/update local conda environment from environment.yml"
	@echo "make build  — build the Docker image"
	@echo "make up     — start JupyterLab at http://localhost:8888?token=local"
	@echo "make down   — stop containers"
	@echo "make logs   — follow container logs"

env:
	conda env update -f environment.yml --prune

build:
	docker compose build

up:
	docker compose up -d
	@echo "JupyterLab → http://localhost:8888/lab?token=local"

down:
	docker compose down

logs:
	docker compose logs -f notebook
