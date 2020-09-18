FROM alpine

VOLUME [ “/sys/fs/cgroup” ]
RUN apk update
RUN apk add openrc
RUN apk add nginx
RUN apk add openssl openssh


# Creating new user and group 'www' for nginx
RUN adduser -D -g 'www' www

# Create a directory for html files
RUN mkdir /www
RUN mkdir /www/test
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/www.pem -keyout /etc/nginx/ssl/www.key -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=rchallie/CN=ft_services"

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./index.html /www/test/index.html
COPY ./nginx_start.sh ./nginx_start.sh

EXPOSE 80 443
CMD sh nginx_start.sh