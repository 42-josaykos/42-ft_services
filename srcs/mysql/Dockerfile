FROM alpine:3.12

LABEL Maintainer="Jonny Saykosy" \
      Description="42 ft_services: Mysql image based on Alpine Linux 3.12"

VOLUME [ "/var/lib/mysql" ]

RUN apk update \
          && apk add --no-cache vim mysql mysql-client openrc

COPY init.sql .
COPY start.sh .
COPY my.cnf /etc/mysql/

RUN chmod u+x start.sh

EXPOSE 3306

CMD ./start.sh

