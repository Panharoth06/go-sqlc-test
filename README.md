## Beginner Flow

1. Create your database and table from `schema.sql`.
2. Put your DB URL in `.env`:
```sh
DATABASE_URL=postgres://postgres:qwer@localhost:5432/sqltest?sslmode=disable
```
3. Generate sqlc code (if you change SQL files):
```sh
sqlc generate
```
4. Run the app:
```sh
go run .
```

## Postgres CLI

To connect to PostgreSQL and enter password:
```sh
psql -h localhost -U postgres -W
```

To create a new database:
```sh
create database database_name;
```

To connect to a specific database:
```sh
\c database_name
```

To list tables in the current database:
```sh
\dt
```
