#!bin/sh

mysql_install_db --user=mysql --ldata=/var/lib/mysql

mysqld_safe &
sleep 5 && mysql -u root < init.sql && mysql -u root wordpress < wordpress.sql
killall mysqld_safe

supervisord -c /etc/supervisord.conf
