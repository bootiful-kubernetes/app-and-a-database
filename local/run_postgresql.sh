#!/usr/bin/env bash

# this works!
# docker run -d -p 80:80 docker/getting-started

docker run  --name postgres-db -e POSTGRES_PASSWORD=password -it  -p 5432:5432 -d postgres:latest  
container_id=$(docker ps -a  | grep postgres | cut -f1 -d\ ) 
echo $container_id
docker logs $container_id

