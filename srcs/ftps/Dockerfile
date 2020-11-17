FROM alpine:3.12

LABEL Maintainer="Jonny Saykosy" \
      Description="42 ft_services: FTPS server image based on Alpine Linux 3.12"

RUN apk update
RUN apk add --no-cache openssl openssh vsftpd supervisor
RUN apk add --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing/ telegraf

COPY liveness.sh .
RUN chmod u+x liveness.sh
RUN mkdir -p /etc/telegraf
COPY telegraf.conf /etc/telegraf

RUN mkdir -p /run/supervisor
COPY supervisord.conf /etc/supervisord.conf

COPY vsftpd.conf /etc/vsftpd.conf

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=FR/ST=Paris/O=42/CN=josaykos' -keyout /etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.crt

RUN addgroup ftps
RUN adduser admin -G ftps -h /home/admin -D
RUN echo "admin:admin" | chpasswd
COPY hello42.txt /home/admin

EXPOSE 20 21 30000
CMD supervisord -c /etc/supervisord.conf
