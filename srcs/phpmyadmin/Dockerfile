# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: leweathe <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/12 12:48:31 by leweathe          #+#    #+#              #
#    Updated: 2020/10/12 12:48:33 by leweathe         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine

RUN		apk update
RUN		apk add openrc supervisor
RUN		apk add php7 php7-mysqli php7-session php7-fpm php7-json php7-phar php7-mbstring php7-iconv php7-gd php7-curl php7-xml php7-imap php7-cgi nginx fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom

RUN		mkdir -p /run/nginx
RUN		mkdir -p /var/run/php

RUN		wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz
RUN		tar zxvf phpMyAdmin-5.0.2-all-languages.tar.gz
RUN		rm phpMyAdmin-5.0.2-all-languages.tar.gz
RUN		mv phpMyAdmin-5.0.2-all-languages /var/www/phpmyadmin

COPY	php-fpm.conf		/etc/php7/php-fpm.conf
COPY	config.inc.php		/var/www/phpmyadmin/config.inc.php
COPY	default.conf		/etc/nginx/conf.d/default.conf
COPY	supervisord.conf	/etc/supervisord.conf

EXPOSE	5000

CMD		["usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
