# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: leweathe <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/06 10:21:02 by leweathe          #+#    #+#              #
#    Updated: 2020/10/06 10:24:26 by leweathe         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

minikube start --vm-driver=virtualbox
eval $(minikube docker-env)

minikube addons enable metallb
kubectl apply -f srcs/metallb.yaml
minikube addons enable metrics-server
minikube addons enable dashboard
minikube dashboard & sleep 10;

# Docker images
docker build -t "nginx-img" srcs/nginx
docker build -t "ftps-img" srcs/ftps
docker build -t "wp-img" srcs/wordpress
docker build -t "mysql-img" srcs/mysql
docker build -t "phpmyadmin-img" srcs/phpmyadmin
docker build -t "grafana-img" srcs/grafana
docker build -t "influxdb-img" srcs/influxdb
docker build -t "telegraf-img" srcs/telegraf

# Kubernetes deployments
kubectl apply -f srcs/nginx/nginx.yaml
kubectl apply -f srcs/ftps/ftps.yaml
kubectl apply -f srcs/wordpress/wordpress.yaml
kubectl apply -f srcs/mysql/mysql.yaml
kubectl apply -f srcs/phpmyadmin/phpmyadmin.yaml
kubectl apply -f srcs/influxdb/influxdb.yaml
kubectl apply -f srcs/grafana/grafana.yaml
kubectl apply -f srcs/telegraf/telegraf.yaml

echo ""
echo ""
echo ""
printf "\033[1;32m HOW TO CHECK \033[0m\n"
echo ""
echo "---NGINX---"
echo "website on port 80:   http://192.168.99.100:80"
echo "website on port 443:  https://192.168.99.100:443"
echo "ssh:"
echo "admin@192.168.99.100 -p 22"
echo "password: admin"
echo ""
echo "---FTPS---"
echo "open FileZilla"
echo "user:     admin"
echo "password: admin"
echo "port:     21"
echo "host:     192.168.99.101"
echo ""
echo "---WORDPRWSS---"
echo "website:  http://192.168.99.102:5050"
echo ""
echo "---PHPMYADMIN---"
echo "website:  http://192.168.99.103:5000"
echo "user:     admin"
echo "password: admin"
echo ""
echo "---GRAFANA---"
echo "website:  http://192.168.99.104:3000"
echo "user:     admin"
echo "password: admin"
echo ""
echo ""