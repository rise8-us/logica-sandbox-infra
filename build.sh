#!/usr/bin/env bash

docker build -t ghcr.io/rise8-us/logica-sandbox-infra/api:latest ./api
docker build -t ghcr.io/rise8-us/logica-sandbox-infra/mysql:latest ./mysql
docker build -t ghcr.io/rise8-us/logica-sandbox-infra/sandbox:latest ./sandbox
docker build -t ghcr.io/rise8-us/logica-sandbox-infra/sandbox-manager-api:latest ./sandbox-manager-api
