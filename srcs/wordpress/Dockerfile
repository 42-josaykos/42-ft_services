FROM alpine:3.12
LABEL Maintainer="Jonny Saykosy" \
      Description="42 ft_services: Wordpress image based on Alpine Linux 3.12"

RUN apk update \
      && apk add --no-cache nginx vim curl  wget supervisor php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session


RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xvzf latest.tar.gz \
      && rm latest.tar.gz

RUN adduser -D -g 'www' www
RUN mkdir -p /run/nginx
# COPY wp-config.php /wordpress/wp-config.php
RUN chown -R www:www /var/lib/nginx \
      && chown -R www:www /wordpress

COPY nginx.conf /etc/nginx/nginx.conf
COPY supervisord.conf /etc/supervisord.conf

EXPOSE 5050
CMD supervisord -c /etc/supervisord.conf
