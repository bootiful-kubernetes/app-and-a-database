#!/usr/bin/env bash

PROJECT_ID=pgtm-jlong
APP_NAME=app-and-db
cd $(dirname $0)/..
root_dir=$(pwd)
docker rmi -f $(docker images -a -q)
mvn spring-boot:build-image
image_id=$(docker images -q $APP_NAME)
docker tag $image_id gcr.io/${PROJECT_ID}/${APP_NAME}
docker push gcr.io/${PROJECT_ID}/${APP_NAME}
docker pull gcr.io/${PROJECT_ID}/${APP_NAME}:latest

kubectl apply -f ./build/postgres-configmaps.yaml
kubectl apply -f ./build/postgres-storage.yaml
kubectl apply -f ./build/postgres-deployment.yaml

# to proxy the k8s service to a local port, you can use the following incantation
# kubectl port-forward wag 8080:8080
