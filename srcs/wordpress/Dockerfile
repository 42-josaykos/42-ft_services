FROM alpine:3.12
LABEL Maintainer="Jonny Saykosy" \
      Description="42 ft_services: Wordpress image based on Alpine Linux 3.12"

RUN apk update
RUN apk add --no-cache nginx vim curl  wget supervisor php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session
RUN apk add --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing/ telegraf

RUN mkdir -p /etc/telegraf
COPY telegraf.conf /etc/telegraf

COPY wordpress.tar.gz .
RUN tar -xzf wordpress.tar.gz
RUN rm wordpress.tar.gz
COPY wp-config.php wordpress/wp-config.php

RUN adduser -D -g 'www' www
RUN mkdir -p /run/nginx \
	&& mkdir -p /run/supervisor \
	&& mkdir -p /var/run/php \
	&& mkdir -p /var/log/php-fpm
RUN chown -R www:www /var/lib/nginx \
      && chown -R www:www wordpress/ \
	&& chmod 777 -R wordpress/wp-content/

COPY nginx.conf /etc/nginx/nginx.conf
COPY supervisord.conf /etc/supervisord.conf

EXPOSE 5050
CMD supervisord -c /etc/supervisord.conf
