FROM alpine

VOLUME [ “/sys/fs/cgroup” ]
RUN apk update
RUN apk add openrc
RUN apk add nginx
RUN apk add openssl openssh
RUN apk upgrade --update-cache --available
RUN rm -rf /var/cache/apk/*

RUN adduser -D www
RUN echo "www:password" | chpasswd

# Create a directory for html files
#RUN mkdir /www
#RUN mkdir /www/test
RUN mkdir /run/nginx
RUN adduser -D "admin"
RUN echo "admin:admin" | chpasswd
#RUN mkdir -p /usr/share/nginx/html
#RUN chown -R www:www /var/lib/nginx
#RUN chown -R www:www /www
#RUN mkdir /etc/nginx/ssl
#RUN ssh-keygen -A
RUN ssh-keygen -f /etc/ssh/ssh_host_rsa_key -t rsa -N ''
#RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/www.pem -keyout /etc/nginx/ssl/www.key -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=rchallie/CN=ft_services"
RUN yes "" | openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt

RUN rm /etc/nginx/conf.d/default.conf
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
RUN sed -i -e "s/#Port 22/Port 2222/g" /etc/ssh/sshd_config
COPY ./index.html /usr/share/nginx/html/index.html
RUN chmod 666 /usr/share/nginx/html/index.html
COPY ./nginx_start.sh ./nginx_start.sh
#COPY ./sshd_config /etc/ssh/sshd_config
#COPY ./index.html /usr/share/nginx/html

RUN chmod 600 /etc/ssh/ssh_host_*
RUN chmod +x nginx_start.sh

EXPOSE 80 443 2222
ENTRYPOINT sh nginx_start.sh