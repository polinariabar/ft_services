# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: leweathe <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/09 13:37:58 by leweathe          #+#    #+#              #
#    Updated: 2020/10/09 13:39:47 by leweathe         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine

RUN apk update
RUN apk add influxdb
RUN apk add --no-cache --upgrade bash

VOLUME ["var/lib/"]
EXPOSE 8086

CMD influxd run -config /etc/influxdb.conf
