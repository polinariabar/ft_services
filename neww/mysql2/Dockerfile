# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: imicah <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/07 12:42:12 by imicah            #+#    #+#              #
#    Updated: 2020/09/15 21:48:24 by imicah           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.7

RUN		apk update && \
		apk add mysql mysql-client

COPY	src/my.cnf			/etc/mysql/my.cnf
COPY	src/start.sh		start.sh

VOLUME	/var/lib/mysql

EXPOSE	3306

ENTRYPOINT	./start.sh
