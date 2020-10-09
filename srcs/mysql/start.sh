#!bin/sh

if [ "ls /var/lib/mysql | wc -l" == 0 ]; then
  mysql_install_db --user=mysql --datadir=/var/lib/mysql
fi
supervisord -c /etc/supervisord.conf
