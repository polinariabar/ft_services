FROM alpine

RUN apk update
RUN apk add mariadb mariadb-client
RUN apk add --no-cache --upgrade bash \
	&& rm -rf /var/cache/apk/*
RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

COPY ./init_container.sh ./init_container.sh
COPY ./init_mysql.sh ./init_mysql.sh
COPY wordpress.sql .
COPY ./telegraf.conf /etc/telegraf/telegraf.conf

RUN chmod 777 init_container.sh
RUN chmod 777 init_mysql.sh

EXPOSE 3306

CMD bash init_container.sh