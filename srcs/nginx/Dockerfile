FROM alpine:3.12
LABEL Maintainer="Jonny Saykosy" \
      Description="42 ft_services project: Nginx container based on Alpine Linux 3.12"

# Install openrc to handle nginx and sshd (openssh) daemons
RUN apk update \
      && apk add --no-cache openrc nginx openssh \
      && rm /etc/nginx/conf.d/default.conf

# Create new user/password admin/admin and generate hostkeys for ssh
RUN adduser -D admin
RUN echo "admin:admin" | chpasswd
RUN ssh-keygen -A

# Create directory for index file and nginx's PID directory in /run
RUN mkdir -p /var/www/html \
      && mkdir -p /run/nginx

# Permissions for nobody on directories
RUN chown -R nobody.nobody /var/www/html \
      && chown -R nobody:nobody /var/lib/nginx \
      && chown -R nobody.nobody /run

# Copy config files and start nginx and sshd daemons
COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /var/www/html/
COPY start.sh ./start.sh
CMD sh start.sh

# Expose ports
EXPOSE 80 443
