FROM alpine

RUN apk update
RUN apk add mariadb mariadb-client
RUN apk add --no-cache --upgrade bash \
	&& rm -rf /var/cache/apk/*

COPY ./init_container.sh ./init_container.sh
COPY ./init_mysql.sh ./init_mysql.sh
COPY wordpress.sql .

RUN chmod 777 init_container.sh
RUN chmod 777 init_mysql.sh

EXPOSE 3306

ENTRYPOINT [ "./init_docker.sh" ]