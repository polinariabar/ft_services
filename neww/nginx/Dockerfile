# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: imicah <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/05 20:26:49 by imicah            #+#    #+#              #
#    Updated: 2020/09/07 16:51:36 by imicah           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM		alpine:3.7

RUN			apk update && \
			apk add openssl nginx openrc supervisor openssh

RUN			mkdir -p /run/nginx

RUN			adduser -D "admin"
RUN			echo "admin:admin" | chpasswd
RUN			/usr/bin/ssh-keygen -A

COPY		./supervisord.conf	/etc/supervisord.conf
COPY		./default.conf		/etc/nginx/conf.d/default.conf
COPY		./index.html		/var/www/index.html

RUN			openssl req -new -newkey rsa:2048 -nodes -x509 -days 500 -subj \
			/C=RU/ST=Moscow/L=Moscow/O=21/OU=leweathe/CN=localhost/emailAddress=leweathe@site.com \
			-keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt

EXPOSE		22 80 443

CMD			["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
