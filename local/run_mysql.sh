#!/usr/bin/env bash

CN=mysql-db
PW=password
docker run --restart always --name mysql8.0 --net dev-network -v `pwd`/data:/var/lib/mysql -p 3306:3306 -d -e MYSQL_ROOT_PASSWORD=$PW mysql:8.0.20
echo "the password is '${PW}'."

