package handler

import "database/sql"

type DataSource struct {
	*sql.DB
}

func OpenDB() (*DataSource, error) {
	conn, err := sql.Open(
		"postgres",
		"postgres://postgres:5024@localhost:5432/Fiber-CRUD?sslmode=disable",
	)
	if err != nil {
		return nil, err
	}

	return &DataSource{DB: conn}, nil
}
