#!/bin/sh

influxd &
sleep 5 && influx -execute "CREATE DATABASE telegraf"
killall influxd

supervisord -c /etc/supervisord.conf
