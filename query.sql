-- name: GetAuthor :one
SELECT * FROM authors 
WHERE id = $1
LIMIT 1;

-- name: ListAuthors :many
SELECT * FROM authors;

-- name: CreateAuthor :one
INSERT INTO authors (
    name, bio, username
) VALUES (
    $1, $2, $3
)
RETURNING *;

-- name: UpdateAuthor :one
UPDATE authors
SET name = $2, bio = $3, username = $4
WHERE id = $1
RETURNING *;

-- name: DeleteAuthor :exec
DELETE FROM authors
WHERE id = $1;