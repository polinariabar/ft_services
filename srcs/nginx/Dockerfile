# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: leweathe <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/06 10:25:46 by leweathe          #+#    #+#              #
#    Updated: 2020/10/06 10:25:48 by leweathe         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine

RUN		apk update
RUN		apk add nginx openssl openssh supervisor

RUN		mkdir -p /run/nginx

RUN		adduser -D admin
RUN		echo "admin:admin" | chpasswd
RUN		/usr/bin/ssh-keygen -A

RUN 	openssl req -new -newkey rsa:2048 -nodes -x509 -days 500 -subj \
		/C=RU/ST=Moscow/L=Moscow/O=21/OU=leweathe/CN=localhost/emailAddress=leweathe@site.com \
		-keyout /etc/ssl/private/nginx-selfsigned.key \
		-out /etc/ssl/certs/nginx-selfsigned.crt

COPY	supervisord.conf	/etc/supervisord.conf
COPY	nginx.conf			/etc/nginx/conf.d/default.conf
COPY	sshd_config			/etc/ssh/sshd_config
COPY	index.html			/var/www/index.html

EXPOSE	22 80 443

CMD		["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]