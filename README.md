## Postgres cli

To connect to postgreSQL database and enter the password
```sh
psql -h localhost -U postgres -W
```

To create a new database 
```sh
create database database_name;
```

To connect to a specific databse
```sh
\c database_name
```

To list down a specific database
```sh
\dt
```
