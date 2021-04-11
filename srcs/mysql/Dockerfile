# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: leweathe <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/12 12:48:05 by leweathe          #+#    #+#              #
#    Updated: 2020/10/12 12:48:07 by leweathe         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine

RUN		apk update
RUN		apk add mysql mysql-client openrc

COPY	wordpress.sql		./wordpress.sql
COPY	my.cnf				/etc/mysql/my.cnf
COPY	start.sh			./start.sh
COPY	init.sql			./init.sql

VOLUME	["/var/lib"]
EXPOSE	3306

CMD	./start.sh
