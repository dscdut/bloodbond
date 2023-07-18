#!/usr/bin/env bash
DOCKER_IMAGE="high10hunter/node"

# Stop and remove the container
docker kill bloodbond
docker rm bloodbond
docker rmi $DOCKER_IMAGE

# Build the Docker image
docker build -t $DOCKER_IMAGE --build-arg MACHINE_NAME=$DOCKER_IMAGE .
docker run -p 3000:3000 --name bloodbond -d $DOCKER_IMAGE
