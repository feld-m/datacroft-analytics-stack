# Datacroft: Analytics Stack

**Datacroft: Analytics Stack** was developed by [FELD M](https://www.feld-m.de/en/) to help you easily set up a pipeline for reporting and analytics. The stack includes the following components:

 - 🚂  a data loading/EL tool (Airbyte) to help you get data from different sources onto your data warehouse
 - 🗄  a simple data warehouse (a PostgreSQL database) where you can store all your data
 - 🪄  a data modeling tool (dbt) to help you transform your raw data into ready-to-use tables
 - 🔭  a visualization tool (Metabase) where you can build dashboards and explore your data
    

We assembled this stack to be easy to spin up, with minimal required resources so you can pull your data and experiment with it as fast as possible. If you have your own machine to run this on (such as a private server, or even just your own laptop), the whole stack is free to run and use, since all the tools are open-source.

## The Stack

It includes the following components as Docker containers:

- EL tool: [Airbyte](https://airbyte.com/)
- Data warehouse: [PostgreSQL](https://www.postgresql.org/)
- Data transformation tool: [dbt](https://www.getdbt.com/)
- BI tool: [Metabase](https://www.metabase.com/)

![image](https://user-images.githubusercontent.com/48355953/205872549-077beafd-01cd-4d78-aba5-21558e9129c6.png)

These are run using Docker Compose, so it assumes you have a private server or a machine to run this on. If you prefer to use cloud-based, all the tools above are also available as cloud subscriptions with free trials.

You can also switch any of the tools above if you prefer to use a different one. For example, if you want to use Tableau instead of Metabase, comment out the Metabase section in the Dockerfile and connect your Tableau instance to the data warehouse. You could also use cloud-based warehouses such as BigQuery.

## Requirements

- [Docker](https://docs.docker.com/get-docker/) with [Docker Compose](https://docs.docker.com/compose/install/)
- [make](https://www.gnu.org/software/make/)

Since we use Docker Compose to run the stack, you will need Docker installed on your machine. We also use a makefile so you can easily run commands to use the stack.

This stack was tested on macOS and Ubuntu.

## Quickstart

### To set up a pipeline in your machine:

1. Make sure that Docker is running
2. Edit the following configuration files (this step is optional -- if you skip it, the stack will still run, the tools will just be configured with the default values/credentials set in the .env files.)
    - `.env`: credentails and configurations for PostgreSQL Data Warehouse, dbt, and Metabase
    - `airbyte.env`: credentials and configuration preferences for Airbyte
3. Open a terminal on the project directory and execute `make run` to start the containers
4. Access the apps from below.

### To **access** the applications:

- **PostgreSQL**: connect to `[host]:5432` using a [PostgreSQL client](https://wiki.postgresql.org/wiki/PostgreSQL_Clients)
- **Airbyte**: open `[host]:8000` on a web browser
- **Metabase**: open `[host]:3000` on a web browser

If you're running this on your own machine, [host] will be localhost, so Airbyte will be available in `localhost:8000`, Metabase in `localhost:3000`, and PostgreSQL from `localhost:5432`.

### To **stop** the containers:
Go to the project folder in the terminal and run `make stop`.

### Some notes

Note that the first time you run make run, the command might take a while to run, since Docker has to pull all the images. After the command finishes, Metabase will also not yet be immediately available, since it's also still setting up. In our experience, this can take around 15 mins or more.

Once you see that Airbyte and Metabase are accessible from the browser, you may get prompted by Airbyte for a username and password. If you did not change these settings from `airbyte.env`, then the defaults are set as username `airbyte` and password `password`.

## Where is the stack best used?
The whole stack runs from two Dockerfiles (one for Airbyte, one for the other tools), which is run on a single machine. Thus, it's best for fast, exploratory work, where you want to be able to get your data and experiment with it as soon as you can, or deliver proof-of-concepts ASAP. It's not as suitable for heavy data syncs or lots of data connections running frequently.

Note that this limitation is not because of the tools themselves. If you want to scale this stack and use it for production workloads, you can take two paths. You can either:
1) install each of the tools natively on (a) machine/s dedicated for your production workload (Airbyte open source, PostgreSQL db, dbt Core, and Metabase open source), (and if needed, such as with Metabase, properly configure each of them for production as described in their docs), or,
2) use the cloud-based versions of the tools.

If going for path #2, the stack we commonly use is: Airbyte Cloud + GCP BigQuery + dbt Cloud/dbt Core (which you can also run in GCP if you prefer) + Metabase Cloud/PowerBI/Looker Studio/any BI tool of your choice.

## Want some help setting this up?
You can contact us here, or at [https://www.feld-m.de/](https://www.feld-m.de/). 😀
