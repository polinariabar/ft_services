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

FROM		alpine:3.7

RUN			apk update
RUN			apk add openssl vsftpd

RUN			openssl req -x509 -nodes -days 365 -newkey rsa:1024 -subj \
			/C=RU/ST=Moscow/L=Moscow/O=21/OU=leweathe \
			-keyout /etc/vsftpd/vsftpd.pem -out /etc/vsftpd/vsftpd.pem

RUN			echo 'root:root' | chpasswd
RUN			rm -rf /etc/vsftpd/vsftpd.conf
COPY		./vsftpd.conf /etc/vsftpd/vsftpd.conf

EXPOSE		20 21 10100

ENTRYPOINT	vsftpd /etc/vsftpd/vsftpd.conf