#!/usr/bin/env bash
# Stop all containers
docker compose stop     
docker compose rm -f
# Pull latest images 
docker compose pull
# Start all containers
docker compose up -d
# Remove unused images
docker image prune -f