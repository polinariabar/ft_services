# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: leweathe <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/18 15:59:52 by leweathe          #+#    #+#              #
#    Updated: 2020/09/18 15:59:54 by leweathe         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine

RUN apk update
RUN apk add ca-certificates wget \                                                                                                                                                                                                      
	&&   update-ca-certificates
# RUN apk add php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip
RUN apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session
RUN apk add nginx openrc supervisor mysql mysql-client

RUN rm -rf /usr/share/wordpress/wp-config.php \
	&& rm -rf /var/cache/apk/*

RUN		mkdir -p /run/nginx
RUN		mkdir -p /var/run/php

RUN wget http://wordpress.org/latest.tar.gz
RUN tar xzvf latest.tar.gz
RUN mv wordpress var/www/wordpress
RUN rm -rf /var/cache/apk/*

COPY ./wp_start.sh ./wp_start.sh
#COPY ./wp-config.php /www/wp-config.php
COPY ./wp-config.php /etc/nginx/conf.d/wordpress.conf

EXPOSE 5050 9000
CMD sh wp_start.sh