.PHONY: help
help:             ## Show the help.
	@echo "Usage: make <target>"
	@echo ""
	@echo "Targets:"
	@fgrep "##" Makefile | fgrep -v fgrep

.PHONY: run
run:          ## Run containers
	docker-compose -f docker-compose-airbyte.yaml --env-file airbyte.env -f docker-compose.yaml up -d
	@echo "Metabase: http://localhost:3000"
	@echo "Airbyte: http://localhost:8000"

.PHONY: stop
stop:          ## Stop containers
	docker-compose -f docker-compose-airbyte.yaml --env-file airbyte.env -f docker-compose.yaml stop

.PHONY: clean
clean:          ## Clean project
	@echo "Deleting untracked files"
	@rm -r dbt/logs
	git clean -fdx

.PHONY: update-airbyte
update-airbyte:          ## Update Airbyte
	curl -L -o airbyte.env https://raw.githubusercontent.com/airbytehq/airbyte/master/.env
	curl -L -o docker-compose-airbyte.yaml https://raw.githubusercontent.com/airbytehq/airbyte/master/docker-compose.yaml

