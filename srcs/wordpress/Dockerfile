# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: leweathe <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/12 12:48:57 by leweathe          #+#    #+#              #
#    Updated: 2020/10/12 12:48:58 by leweathe         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine

RUN		apk update
RUN		apk add openrc php7 php7-fpm php7-json php7-mysqli nginx supervisor

RUN		mkdir -p /var/run/php
RUN		mkdir -p /run/nginx
RUN		wget https://wordpress.org/latest.tar.gz
RUN		tar -xf latest.tar.gz
RUN		mv wordpress 		/var/www/wordpress

COPY	php-fpm.conf		/etc/php7/php-fpm.conf
COPY	wp-config.php		/var/www/wordpress/wp-config.php
COPY	default.conf		/etc/nginx/conf.d/default.conf
COPY	supervisord.conf	/etc/supervisord.conf

EXPOSE	5050

CMD		["usr/bin/supervisord", "-c", "/etc/supervisord.conf"]

