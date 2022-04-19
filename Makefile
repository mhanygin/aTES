#!make
.PHONY: images

# docs
images:
	for filename in $(shell find $(PWD) -type f | grep puml); do \
  		echo "\n$(notdir $$filename)"; \
		plantuml -o render -progress $$filename; \
	done

# Migrations
migrations-create:
	@read -p "Name of the service: " service \
	&& read -p "Name of the migration: " migration \
	&& echo "Create migrations $$migration at postgres ${DB_MASTER_DSN}" \
	&& goose -dir ./services/$$service/migrations postgres "${DB_MASTER_DSN}" create $$migration sql

migrations-up:
	@read -p "Name of the service: " service \
	&& goose -dir ./services/$$service/migrations postgres "${DB_MASTER_DSN}" up

migrations-down:
	@read -p "Name of the service: " service \
	&&	@goose -dir ./services/$$service/migrations postgres "${DB_MASTER_DSN}" down
