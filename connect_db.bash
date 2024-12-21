#!/bin/bash

source .env

if [ -z "$POSTGRES_USER" ] || [ -z "$POSTGRES_PASSWORD" ] || [ -z "$POSTGRES_DB" ]; then
  echo "Error: Missing environment variables (POSTGRES_USER, POSTGRES_PASSWORD, POSTGRES_DB) in .env file."
  exit 1
fi

docker compose exec postgres-db psql -U "$POSTGRES_USER" -d "$POSTGRES_DB"
