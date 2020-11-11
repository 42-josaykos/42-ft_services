FROM alpine:3.12

LABEL Maintainer="Jonny Saykosy" \
      Description="42 ft_services: grafana image based on Alpine Linux 3.12"

WORKDIR /usr/share/grafana

RUN apk update && \
    apk add curl wget supervisor && \
    apk add grafana --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/

RUN apk add --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing/ telegraf

RUN mkdir -p /etc/telegraf
COPY telegraf.conf /etc/telegraf

COPY datasource.yaml /usr/share/grafana/conf/provisioning/datasources/
RUN mkdir -p /usr/share/grafana/conf/provisioning/dashboards/ft_services
COPY dashboards/*.json /usr/share/grafana/conf/provisioning/dashboards/ft_services/
COPY dashboards/dashboards.yaml /usr/share/grafana/conf/provisioning/dashboards/

RUN mkdir -p /run/supervisor
COPY supervisord.conf /etc/supervisord.conf

EXPOSE 3000

CMD supervisord -c /etc/supervisord.conf
