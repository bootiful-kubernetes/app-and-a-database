#!/usr/bin/env bash
docker run -p 5432:5432 \
   --name postgres-db \
  -d postgres:latest \
  -e POSTGRES_PASSWORD=password
# -e POSTGRES_HOST_AUTH_METHOD=trust
  #-it
