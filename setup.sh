#!/bin/sh

echo "Setting up basic analytics pipeline..."

echo "1) Spinning up postgres warehouse container..."
docker pull postgres:bullseye
docker run -d -p 5432:5432 \
    --env-file ./postgres/config/.env-postgres \
    -v warehouse-volume:/var/lib/posgresql/data \
    --name postgres-warehouse \
    postgres:bullseye 

echo "2) Initializing dbt project..."
docker pull "ghcr.io/dbt-labs/dbt-postgres:1.2.latest"
docker run -d \
-v $(pwd):/usr/app \
-v $(pwd)/dbt/config/profiles.yml:/root/.dbt/profiles.yml \
--name dbt \
"ghcr.io/dbt-labs/dbt-postgres:1.2.latest" init [DBT-PROJECT-NAME]

echo "3) Spinning up metabase container..."
docker pull "metabase/metabase:latest"
docker run -d -p 3000:3000 --name metabase "metabase/metabase:latest"

echo "4) Spinning up Airbyte..."
git clone https://github.com/airbytehq/airbyte.git
cd airbyte & docker compose up
