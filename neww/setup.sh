#!/bin/bash

services=("nginx")

minikube start --vm-driver=virtualbox
eval $(minikube docker-env) > /dev/null

minikube addons enable metallb
kubectl apply -f minikube_confs/metallb-configmap.yaml

docker build nginx -t "nginx-image"
docker build wp -t "my-wp"
kubectl apply -f minikube_confs/nginx.yaml
kubectl apply -f wp/wp.yaml

