minikube start --vm-driver=virtualbox #--extra-config=apiserver.service-node-port-range=1-35000
eval $(minikube docker-env)
minikube addons enable metallb
kubectl apply -f file.yaml
docker build -t my-nginx ./nginx
kubectl create -f nginx/newnginx.yaml
