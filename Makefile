DOCKER ?= docker
COMPOSE ?= docker compose
BUILDER ?= easyappointments-builder
UID ?= $(shell id -u)
GID ?= $(shell id -g)

.PHONY: builder
builder:
	$(DOCKER) build -t $(BUILDER) .

.PHONY: build-fe
build-fe:
	$(DOCKER) run --rm -v $$PWD:/app --workdir /app --entrypoint npm --user $(UID):$(GID) -ti node install

.PHONY: build-be
build-be:
	$(DOCKER) run --rm -v $$PWD:/app -ti $(BUILDER) install

.PHONY: build
build: build-fe build-be

.PHONY: run
run:
	$(COMPOSE) -f docker/docker-compose.yml up

.PHONY: up
up: run

.PHONY: down
down:
	$(COMPOSE) -f docker/docker-compose.yml down -v

