package main

import (
	"context"
	"database/sql"
	"fmt"
	"log"
	"os"

	_ "github.com/jackc/pgx/v5/stdlib"
	_ "github.com/joho/godotenv/autoload"
	"go-sqlc/internal/database"
)

func run() error {
	ctx := context.Background()

	dsn := os.Getenv("DATABASE_URL")
	if dsn == "" {
		return fmt.Errorf("DATABASE_URL is not set")
	}

	db, err := sql.Open("pgx", dsn)
	if err != nil {
		return fmt.Errorf("open connection: %w", err)
	}
	defer db.Close()

	if err := db.PingContext(ctx); err != nil {
		return fmt.Errorf("ping database: %w", err)
	}

	queries := database.New(db)

	authors, err := queries.ListAuthors(ctx)
	if err != nil {
		return fmt.Errorf("list authors: %w", err)
	}

	fmt.Printf("Connected successfully. Authors in DB: %d\n", len(authors))
	
	createAuthor, err := queries.CreateAuthor(ctx, database.CreateAuthorParams{
		Name: "Naabu",
		Bio: "Naabu, a powerful port enumeration toool",
		Username: "Labubu version 3",
	})

	if err != nil {
		return fmt.Errorf("Create author: %w", err)
	}

	fmt.Printf("Create author successfully %s\n", createAuthor.Username)
	
	return nil
}

func main() {
	if err := run(); err != nil {
		log.Fatal(err)
	}

}
