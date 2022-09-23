# Reporting Blueprint

The Reporting Blueprint helps you easily set up a simple pipeline for reporting and analytics. It includes the following components:

- EL tool: Airbyte
- Warehouse: postgres
- Data transformation tool: dbt
- BI tool: Metabase

All components are run in containers.

## Using the blueprint

To set up a pipeline in your machine:

1. Edit the `postgres/config/.env-postgres` file with the database credentials that you want to use for your Postgres data warehouse. The script will use these credentials to create a data warehouse that will be running in a Docker container.
2. Edit the `dbt/config/profiles.yml` file by filling in the project name you want to use for your dbt project, and the credentials/details you used in the data warehouse above.
3. Edit the `setup.sh` file on Line 19, by changing `[DBT-PROJECT-NAME]`to match the one you used in *profiles.yml* above.
4. Run `chmod +x setup.sh`
5. Run `./setup.sh`
