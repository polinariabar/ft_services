#!/bin/bash

services=("nginx")

minikube start --vm-driver=virtualbox
eval $(minikube docker-env) > /dev/null

minikube addons enable metallb
kubectl apply -f minikube_confs/metallb-configmap.yaml

docker build nginx -t "nginx-image"
docker build wordpress -t "wordpress-image"
docker build mysql -t "mysql-image"
kubectl apply -f minikube_confs/nginx.yaml
kubectl apply -f minikube_confs/wordpress.yaml
kubectl apply -f minikube_confs/mysql.yaml
kubectl apply -f minikube_confs/volume.yaml

