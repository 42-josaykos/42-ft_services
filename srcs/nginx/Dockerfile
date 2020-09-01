FROM alpine:3.12
LABEL maintainer="Jonny Saykosy"

RUN apk update \
      && apk add --no-cache openrc nginx \
      && rm /etc/nginx/conf.d/default.conf

RUN mkdir -p /var/www/html \
      &&mkdir -p /run/nginx

RUN chown -R nobody.nobody /var/www/html \
      && chown -R nobody:nobody /var/lib/nginx \
      && chown -R nobody.nobody /run

COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /var/www/html/
COPY start.sh ./start.sh
CMD sh start.sh

EXPOSE 80 443

