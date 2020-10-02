#!/bin/bash
minikube start --vm-driver=virtualbox
eval $(minikube docker-env) > /dev/null

minikube addons enable metallb
kubectl apply -f metallb-configmap.yaml


docker build -t my-nginx nginx
docker build -t my-wp wp
docker build -t my-mysql mysql

# kubectl apply -f srcs/minikube_confs/volume.yaml

kubectl apply -f wp/wp.yaml
kubectl apply -f nginx/nginx.yaml
kubectl apply -f mysql/mysql.yaml
