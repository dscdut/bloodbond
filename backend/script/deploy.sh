#!/usr/bin/env bash
# stop and remove all containers
docker compose stop     
docker compose rm -f
# pull latest image from DockerHub
docker compose pull
# rebuilt project
docker compose up -d
# remove all dangling images
docker image prune -f