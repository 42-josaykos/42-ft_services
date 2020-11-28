# 42-ft_services
SysAdmin / DevOps project: basic production environment with K8s

Tested with Minikube v1.15.0.
Should work as long as `minikube ip` is mapped to `192.168.49.2` or change it in the following files:
```
srcs/manifests/metallb-config.yaml
srcs/ftps/vsftpd.conf
srcs/ftps/ssl_test.sh
srcs/nginx/nginx.conf
srcs/mysql/wordpress.sql
```
