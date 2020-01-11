# Lar

**Fetches apartment offers from various sources.**


## Installation
Optionally, you can [run the application with Docker](#running-the-app-with-docker).
1. Install Erlang 20.0 or later
2. Install Elixir 1.9+
3. Run `make`

## Running the tests
In the root folder, run `make test` _(Requires Docker)_

## Running the app locally
Run `make start`

## Running the app with Docker
1. Install Docker
2. Run `make docker-image`
3. Run `make start-with-docker`

Also, you can pass the port when starting with docker:
`PORT=4001 make start-with-docker`
