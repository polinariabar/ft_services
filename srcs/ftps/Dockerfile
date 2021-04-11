# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: leweathe <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/03 18:59:49 by leweathe          #+#    #+#              #
#    Updated: 2020/10/03 18:59:51 by leweathe         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM		alpine

RUN			apk update
RUN			apk add vsftpd
RUN			apk add openssl

RUN			openssl req -x509 -nodes -days 365 -newkey rsa:1024 -subj \
			/C=RU/ST=Moscow/L=Moscow/O=21/OU=leweathe \
			-keyout /etc/vsftpd/vsftpd.pem \
			-out /etc/vsftpd/vsftpd.pem

RUN			adduser -D -h /var/ftp admin
RUN			echo 'admin:admin' | chpasswd
RUN			rm -rf			/etc/vsftpd/vsftpd.conf
COPY		vsftpd.conf		/etc/vsftpd/vsftpd.conf
RUN			mkdir -p		/var/log/ftp

EXPOSE		20 21 10100
CMD			vsftpd /etc/vsftpd/vsftpd.conf
