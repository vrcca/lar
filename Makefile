PORT?=4001
ENV?=dev

.PHONY: build, dependencies, start, unit-test, integration-test, start-dependencies, stop-dependencies, restart-dependencies, test

build: dependencies
	mix compile

dependencies:
	printf 'Y'  | mix local.hex --if-missing && \
	printf 'nn' | mix local.rebar  && \
	mix deps.get

start:
	PORT=$(PORT) mix run --no-halt

test:
	$(MAKE) unit-test && \
	$(MAKE) start-dependencies && \
	$(MAKE) integration-test && \
	$(MAKE) stop-dependencies

unit-test:
	MIX_ENV=test mix test --exclude integration

integration-test:
	MIX_ENV=integration mix test --only integration

start-dependencies:
	docker-compose up -d

stop-dependencies:
	docker-compose down

restart-dependencies:
	$(MAKE) stop-dependencies && $(MAKE) start-dependencies

release:
	MIX_ENV=$(ENV) mix release --overwrite

docker-image:
	docker build -t lar-app .

start-with-docker:
	docker run \
	--publish $(PORT):$(PORT) \
	--env PORT=$(PORT) \
	--env AF_API_KEY=$(AF_API_KEY) \
	--env BA_API_KEY=$(BA_API_KEY) \
	lar-app:latest
