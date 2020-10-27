FROM alpine:3.12
LABEL Maintainer="Jonny Saykosy" \
      Description="42 ft_services: phpmyadmin image based on Alpine Linux 3.12"

RUN apk update
RUN apk add --no-cache wget curl nginx gettext php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session php7-zip supervisor

RUN mkdir -p /run/nginx &&  mkdir -p /www/tmp
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-english.tar.gz
RUN tar -xzf phpMyAdmin-5.0.1-english.tar.gz --strip-components=1 -C /www && chmod 777 /www/tmp
RUN rm phpMyAdmin-5.0.1-english.tar.gz

RUN adduser -D -g 'www' www

COPY config.inc.php /www
COPY nginx.conf /etc/nginx/nginx.conf
COPY supervisord.conf /etc/supervisord.conf

RUN chown -R www:www /var/lib/nginx \
      && chown -R www:www /www

EXPOSE 5000
CMD supervisord -c /etc/supervisord.conf