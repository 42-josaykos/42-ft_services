#!/bin/bash

minikube start --vm-driver=docker
CLUSTER_IP="$(kubectl get node -o=custom-columns='DATA:status.addresses[0].address' | sed -n 2p)"
echo "Minikube IP: $CLUSTER_IP"

if [[ $CLUSTER_IP != "192.168.49.2" ]]; then
  sed -i "s/192.168.49.2/$CLUSTER_IP/g" "srcs/manifests/metallb-config.yaml"
  sed -i "s/192.168.49.2/$CLUSTER_IP/g" "srcs/ftps/vsftpd.conf"
  sed -i "s/192.168.49.2/$CLUSTER_IP/g" "srcs/ftps/ssl_test.sh"
  sed -i "s/192.168.49.2/$CLUSTER_IP/g" "srcs/nginx/nginx.conf"
  sed -i "s/192.168.49.2/$CLUSTER_IP/g" "srcs/mysql/wordpress.sql"
fi

eval $(minikube docker-env)
echo "Building nginx image..."
docker build -t services/nginx srcs/nginx > /dev/null
echo "Building mysql image..."
docker build -t services/mysql srcs/mysql > /dev/null
echo "Building wordpress image..."
docker build -t services/wordpress srcs/wordpress > /dev/null
echo "Building phpmyadmin image..."
docker build -t services/phpmyadmin srcs/phpmyadmin > /dev/null
echo "Building ftps server image..."
docker build -t services/ftps srcs/ftps > /dev/null
echo "Building influxdb image..."
docker build -t services/influxdb srcs/influxdb > /dev/null
echo "Building grafana image..."
docker build -t services/grafana srcs/grafana > /dev/null

echo "Applying manifests..."
kubectl apply -f srcs/manifests/metallb-namespace.yaml > /dev/null
kubectl apply -f srcs/manifests/metallb.yaml > /dev/null
kubectl apply -f srcs/manifests/metallb-config.yaml > /dev/null
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

kubectl apply -f srcs/manifests/nginx.yaml > /dev/null
kubectl apply -f srcs/manifests/mysql.yaml > /dev/null
kubectl apply -f srcs/manifests/wordpress.yaml > /dev/null
kubectl apply -f srcs/manifests/phpmyadmin.yaml > /dev/null
kubectl apply -f srcs/manifests/ftps.yaml > /dev/null
kubectl apply -f srcs/manifests/influxdb.yaml > /dev/null
kubectl apply -f srcs/manifests/grafana.yaml > /dev/null

minikube dashboard &
echo "✅ ft_services deployment done. Waiting for minikube dashboard..."
