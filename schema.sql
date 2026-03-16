-- This file defines your database structure (schema).
-- sqlc reads this to understand table/column types.

-- authors table stores basic profile data.
CREATE TABLE authors (
  -- BIGSERIAL = auto-incrementing 64-bit integer.
  id   BIGSERIAL PRIMARY KEY,
  -- NOT NULL means every row must include these fields.
  name text      NOT NULL,
  bio  text     NOT NULL,
  -- UNIQUE means no two rows can share the same username.
  username text UNIQUE NOT NULL
);
