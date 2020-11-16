FROM alpine:3.12
LABEL Maintainer="Jonny Saykosy" \
      Description="42 ft_services: Nginx image based on Alpine Linux 3.12"

# Install supervisor to handle nginx and sshd (openssh) daemons
RUN apk update
RUN apk add --no-cache supervisor nginx openssh openssl sudo
RUN apk add --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing/ telegraf

COPY liveness.sh .
RUN chmod u+x liveness.sh
RUN mkdir -p /etc/telegraf
COPY telegraf.conf /etc/telegraf

# Create new user/password admin/admin and generate hostkeys for ssh
RUN adduser -D admin
RUN echo "admin:admin" | chpasswd
RUN echo "admin ALL=(ALL) ALL" >> /etc/sudoers
RUN echo "Welcome into ft_services - Nginx container (by josaykos)" > /etc/motd
RUN ssh-keygen -A

# Create auto-signed SSL certificates
RUN yes "" | openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/selfsigned.key -out /etc/ssl/certs/selfsigned.crt

# Create directory for index file and nginx's PID directory in /run
RUN mkdir -p /var/www/html \
      && mkdir -p /run/nginx \
      && mkdir -p /run/supervisor

# Copy config files
COPY supervisord.conf /etc/supervisord.conf
COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /var/www/html/

# Permissions for nginx user www-data
RUN chown -R admin:admin /var/www/html \
      && chown -R admin:admin /var/lib/nginx \
      && chown -R admin:admin /run

# Expose ports
EXPOSE 80 443 22

# Start nginx
CMD supervisord -c /etc/supervisord.conf

