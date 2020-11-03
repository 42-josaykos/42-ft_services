FROM alpine:3.12

LABEL Maintainer="Jonny Saykosy" \
      Description="42 ft_services: influxdb image based on Alpine Linux 3.12"

VOLUME [ "/var/lib/influxdb" ]

RUN apk update
RUN apk add --no-cache vim influxdb supervisor
RUN apk add --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing/ telegraf

RUN mkdir -p /etc/telegraf
COPY telegraf.conf /etc/telegraf

RUN mkdir -p /etc/influxdb
COPY influxdb.conf /etc/influxdb
RUN chown -R influxdb:influxdb /etc/influxdb

RUN mkdir -p /run/supervisor
COPY supervisord.conf /etc/supervisord.conf

COPY start.sh .
RUN chmod u+x start.sh

EXPOSE 8086
ENTRYPOINT ./start.sh
