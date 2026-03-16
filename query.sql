-- sqlc uses the header format below to generate Go methods:
-- -- name: MethodName :result_type
-- Result types:
--   :one  -> return a single row
--   :many -> return multiple rows
--   :exec -> execute without returning rows

-- Get one author by ID.
-- name: GetAuthor :one
SELECT * FROM authors 
WHERE id = $1
LIMIT 1;

-- Get all authors.
-- name: ListAuthors :many
SELECT * FROM authors;

-- Insert one author.
-- $1, $2, $3 are positional parameters from Go.
-- name: CreateAuthor :one
INSERT INTO authors (
    name, bio, username
) VALUES (
    $1, $2, $3
)
RETURNING *;

-- Update one author by ID.
-- name: UpdateAuthor :one
UPDATE authors
SET name = $2, bio = $3, username = $4
WHERE id = $1
RETURNING *;

-- Delete one author by ID.
-- name: DeleteAuthor :exec
DELETE FROM authors
WHERE id = $1;
