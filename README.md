# Reporting Blueprint

The Reporting Blueprint helps you easily set up a simple pipeline for reporting and analytics. It includes the following components:

- EL tool: Airbyte
- Warehouse: postgres
- Data transformation tool: dbt
- BI tool: Metabase

All components are run in containers.

## Using the blueprint

To set up a pipeline in your machine:

1. Edit the `postgres/config/.env-postgres` file with the database credentials that you want to use for your PostgreSQL data warehouse. The script will use these credentials to create a data warehouse that will be running in a Docker container.
2. Edit the `dbt/config/profiles.yml` file by filling in the project name you want to use for your dbt project, and the credentials/details you used in the data warehouse above. (Hint: remember to use only letters, digits, and underscores in the dbt project name!)
3. Edit the `setup.sh` file on Line 19, by changing `[DBT-PROJECT-NAME]`to match the one you used in *profiles.yml* above.
4. Run `chmod +x setup.sh`
5. Run `./setup.sh`

You can access the applications like so:
- Access the PostgreSQL data warehouse by connecting to port 5432 on the host machine
- Access Airbyte on the browser by going to `localhost:8000`
- Access Metabase on the browser by going to `localhost:3000`
