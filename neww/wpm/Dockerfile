# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: leweathe <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/29 07:57:09 by leweathe          #+#    #+#              #
#    Updated: 2020/09/29 08:02:58 by leweathe         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.7

RUN apk update
RUN apk add ca-certificates wget && update-ca-certificates
RUN apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session
RUN apk add openrc supervisor
RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

RUN rm -rf /usr/share/wordpress/wp-config.php && rm -rf /var/cache/apk/*
RUN mkdir -p /run/nginx && mkdir -p /var/run/php

RUN wget http://wordpress.org/latest.tar.gz
RUN tar xzvf latest.tar.gz
RUN mkdir /var/www/
RUN mv wordpress /var/www/wordpress
RUN rm -rf /var/cache/apk/*
RUN echo $IP > ip.txt

COPY ./wp_start.sh ./wp_start.sh
COPY wp-config.php /var/www/wordpress/wp-config.php
COPY supervisord.conf /etc/supervisord.conf
COPY ./telegraf.conf /etc/telegraf/telegraf.conf

EXPOSE 5050
RUN chmod +x wp_start.sh
CMD sh wp_start.sh
