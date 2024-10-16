.DELETE_ON_ERROR:

COMPOSE_FILE_PATH := docker-compose.yml
COMPOSE := docker compose -f $(COMPOSE_FILE_PATH)
EXEC := npm run
START_COMMAND := start:dev
BUILD_COMMAND := build

# HELP =================================================================================================================
# This will output the help for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
help: ## Display this help screen
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

start: setup ## Build the app deps, docker images and start the app

setup: compose-build compose app-build app-start ## Build the app deps, docker images

test: ## Start the app tests
	$(EXEC) test

app-hard-reset: docker-clean app-clean start ## Delete all deps, containers, images and rebuild whole project

app-soft-reset: compose-restart app-start ## Restart containers and app

docker-clean: compose-down ## Delete all containers and images
	docker system prune -f -a --volumes

app-clean: ## Delete all app artifacts
	rm -rf ./docs
	rm -rf ./logs
	rm -rf ./node_modules
	rm -rf ./dist

compose-build: ## Build the docker images
	$(COMPOSE) build

app-build: ## Build the app
	mkdir ./docs
	$(EXEC) $(BUILD_COMMAND)

app-start: ## Start the app
	$(EXEC) $(START_COMMAND)

compose: compose-down ## Stop the app
	$(COMPOSE) up -d
	$(COMPOSE) ps

compose-restart: ## Restart the app
	$(COMPOSE) restart
	$(COMPOSE) ps

compose-down: ## Stop the containers
	$(COMPOSE) down || true
