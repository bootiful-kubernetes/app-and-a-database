#!/usr/bin/env bash

PROJECT_ID=pgtm-jlong
APP_NAME=app-and-db
cd $(dirname $0)/..
root_dir=$(pwd)
# docker rmi -f $(docker images -a -q)
# mvn -DskipTests=true clean spring-boot:build-image
# image_id=$(docker images -q $APP_NAME)
# docker tag $image_id gcr.io/${PROJECT_ID}/${APP_NAME}
# docker push gcr.io/${PROJECT_ID}/${APP_NAME}
# docker pull gcr.io/${PROJECT_ID}/${APP_NAME}:latest



## Deploy
kubectl apply -f $root_dir/deploy/mysql-configmap.yaml
kubectl apply -f $root_dir/deploy/mysql-storage.yaml
kubectl apply -f $root_dir/deploy/mysql-deployment.yaml
kubectl apply -f $root_dir/deploy/mysql-service.yaml

kubectl apply -f $root_dir/deploy/app-configmap.yaml
kubectl apply -f $root_dir/deploy/app-deployment.yaml
kubectl apply -f $root_dir/deploy/app-service.yaml

# kubectl expose deployment  app --name=app --type=LoadBalancer --port 80 --target-port 8080
# to proxy the k8s service to a local port, you can use the following incantation
# kubectl port-forward wag 8080:8080
# run k get all and you'll see the services including the external IP