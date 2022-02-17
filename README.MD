# Database Initialization Process

## Prerequisites
 * Docker
 * PostgreSQL
 * SQL



## Steps
1. use container service to manage databases(create, host and destroy)
2. write compose file to setup database (docker-compose.yml)
3. execute docker and docker-compose command
4. connect to database use command line or GUI tool
5. design database via GUI tool (Database First)
6. check .env file to setup environment variables

## Scripts

``` bash
# access postgreSql database host in docker via terminal
docker exec -it local_postgredb_dev sh

psql -d exampledb -U [username] -W
```

## References
1. [azure data studio](https://www.sqlshack.com/access-postgresql-databases-using-the-azure-data-studio-extension/)
2. [configure uuid extension](https://www.postgresqltutorial.com/postgresql-uuid/)
