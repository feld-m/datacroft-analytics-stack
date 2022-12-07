# Datacroft: Analytics Stack

**Datacroft: Analytics Stack** was developed by [FELD M](https://www.feld-m.de/en/) to help you easily set up a pipeline for reporting and analytics.

## The Stack

![image](https://user-images.githubusercontent.com/48355953/205872549-077beafd-01cd-4d78-aba5-21558e9129c6.png)

It includes the following components as Docker containers:

- EL tool: [Airbyte](https://airbyte.com/)
- Data warehouse: [PostgreSQL](https://www.postgresql.org/)
- Data transformation tool: [dbt](https://www.getdbt.com/)
- BI tool: [Metabase](https://www.metabase.com/)

## Requirements

- [Docker](https://docs.docker.com/get-docker/) with [Docker Compose](https://docs.docker.com/compose/install/)
- [make](https://www.gnu.org/software/make/)


This stack was tested on macOS and Ubuntu.

## Quickstart

To set up a pipeline in your machine:

1. Make sure that the Docker service is running
2. Edit the following configuration files:
    - `.env`: credentails and configurations for PostgreSQL Data Warehouse, dbt, and Metabase
    - `airbyte.env`: credentials and configuration preferences for Airbyte
3. Open a terminal on the project directory and execute `make run` to start the containers

To access the applications:

- **PostgreSQL**: connect to `[host]:5432` using a [PostgreSQL client](https://wiki.postgresql.org/wiki/PostgreSQL_Clients)
- **Airbyte**: open `[host]:8000` on a web browser
- **Metabase**: open `[host]:3000` on a web browser

To stop the containers, go to the project folder in the terminal and run `make stop`.

