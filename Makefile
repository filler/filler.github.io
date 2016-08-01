.PHONY: all plan apply destroy
.SILENT: banner help
	
SHELL := /bin/bash

CMD := docker-compose
PWD := $(shell pwd)

help: banner
	grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

banner:
	echo ""
	echo "                                            _____ "
	echo "                          _     _       _ _|___  |"
	echo "         ___ _ _ ___     |_|___| |_ _ _| | | |  _|"
	echo "        |_ -| | | . |    | | -_| '_| | | | | |_|  "
	echo "        |___|___|  _|   _| |___|_,_|_  |_|_| |_|  "
	echo "                |_|    |___|       |___|          "
	echo ""

pull: ## Update local jekyll docker image
	@$(CMD) pull

up: ## Run local jekyll instance in docker
	@$(CMD) up -d && sleep 3 && \
		open http://0.0.0.0:4000/

kill: ## Kill containers
	@$(CMD) kill

down: ## Stop and remove containers, networks, images, and volumes
	@$(CMD) down

logs: ## View output from containers
	@$(CMD) logs

ps: ## List containers
	@$(CMD) ps
