#!/bin/sh

openssl s_client -connect 192.168.49.2:21 -starttls ftp -CApath /etc/ssl/certs/
