CREATE TABLE authors (
  id   BIGSERIAL PRIMARY KEY,
  name text      NOT NULL,
  bio  text     NOT NULL,
  username text UNIQUE NOT NULL
);