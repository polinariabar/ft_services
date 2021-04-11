# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: leweathe <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/09 14:22:12 by leweathe          #+#    #+#              #
#    Updated: 2020/10/09 14:40:28 by leweathe         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine

RUN		apk update
RUN		apk add --no-cache --upgrade bash
RUN		apk --no-cache add ca-certificates
RUN		apk add grafana --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/

RUN		mkdir					/usr/share/grafana/conf/provisioning/dashboards/ft_services

COPY	ftps.json				/usr/share/grafana/conf/provisioning/dashboards/ft_services/ftps.json
COPY	grafana.json			/usr/share/grafana/conf/provisioning/dashboards/ft_services/grafana.json
COPY	influxdb.json			/usr/share/grafana/conf/provisioning/dashboards/ft_services/influxdb.json
COPY	mysql.json				/usr/share/grafana/conf/provisioning/dashboards/ft_services/mysql.json
COPY	nginx.json				/usr/share/grafana/conf/provisioning/dashboards/ft_services/nginx.json
COPY	phpmyadmin.json			/usr/share/grafana/conf/provisioning/dashboards/ft_services/phpmyadmin.json
COPY	telegraf.json			/usr/share/grafana/conf/provisioning/dashboards/ft_services/telegraf.json
COPY	wordpress.json			/usr/share/grafana/conf/provisioning/dashboards/ft_services/wordpress.json

COPY	datasource.yaml			/usr/share/grafana/conf/provisioning/datasources/datasource.yaml
COPY	dashboard.yaml			/usr/share/grafana/conf/provisioning/dashboards/dashboard.yaml

EXPOSE 3000

WORKDIR /usr/share/grafana

CMD /usr/sbin/grafana-server web
