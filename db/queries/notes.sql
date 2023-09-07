-- name: CreateNote :one
INSERT INTO notes (user_id, title, content, is_favourite, image_url) VALUES ($1, $2, $3, $4, $5) RETURNING *;

-- name: GetAllNotes :many
SELECT * FROM notes WHERE user_id = $1;

-- name: GetNoteById :one
SELECT * FROM notes WHERE user_id = $1 AND id = $2;

-- name: DeleteNote :exec
DELETE FROM notes WHERE user_id = $1 AND id = $2;

-- name: UpdateNote :one
UPDATE notes 
SET title = $3, content = $4, is_favourite = $5, image_url = $6
WHERE  user_id = $1 AND id = $2
RETURNING *;

-- name: AddToFavourites :one
UPDATE notes
set is_favourite = true
WHERE  user_id = $1 AND id = $2
RETURNING *;

-- name: RemoveFromFavourites :one
UPDATE notes
set is_favourite = false
WHERE  user_id = $1 AND id = $2
RETURNING *;

-- name: ListFavourites :many
SELECT * FROM notes WHERE user_id = $1 AND is_favourite = true;