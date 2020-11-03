FROM alpine:3.12

LABEL Maintainer="Jonny Saykosy" \
      Description="42 ft_services: Mysql image based on Alpine Linux 3.12"

VOLUME [ "/var/lib/mysql" ]

RUN apk update
RUN apk add --no-cache vim mysql mysql-client supervisor

COPY init.sql .
COPY wordpress.sql .
COPY my.cnf /etc/mysql/

RUN mkdir -p /run/supervisor
COPY supervisord.conf /etc/supervisord.conf

COPY start.sh .
RUN chmod u+x start.sh

EXPOSE 3306

CMD ./start.sh

