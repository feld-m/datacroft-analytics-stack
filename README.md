# Datacroft: Analytics Stack

The Analytics Stack helps you easily set up a simple pipeline for reporting and analytics. It includes the following components:

- EL tool: Airbyte
- Warehouse: postgres
- Data transformation tool: dbt
- BI tool: Metabase

## Quickstart

To set up a pipeline in your machine:

1. Edit the `.env-analytics` file to add credentials and configure settings for PostgreSQL, dbt, and Metabase. (Hint: remember to use only letters, digits, and underscores in the dbt project name!)
2. Run `make run`.

You can access the applications like so:
- Access the PostgreSQL data warehouse by connecting to port 5432 on the host machine
- Access Airbyte on the browser by going to `localhost:8000`
- Access Metabase on the browser by going to `localhost:3000`

## Requirements
- Make sure you have `docker` and `docker compose` installed in your machine.
- This stack was tested on macOS and Ubuntu, we recommend that you use these operating systems to set up your analytics stack.

## The Stack

All components are run in containers.

![image](https://user-images.githubusercontent.com/48355953/205872549-077beafd-01cd-4d78-aba5-21558e9129c6.png)
