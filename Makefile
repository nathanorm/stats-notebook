.PHONY: build up down logs help

help:
	@echo "make build  — build the Docker image"
	@echo "make up     — start JupyterLab at http://localhost:8888?token=local"
	@echo "make down   — stop containers"
	@echo "make logs   — follow container logs"

build:
	docker compose build

up:
	docker compose up -d
	@echo "JupyterLab → http://localhost:8888/lab?token=local"

down:
	docker compose down

logs:
	docker compose logs -f notebook
