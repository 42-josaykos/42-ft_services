#!/bin/sh

minikube start --vm-driver=docker

eval $(minikube docker-env)
echo "Building nginx image..."
docker build -t services/nginx srcs/nginx > /dev/null
echo "Building mysql image..."
docker build -t services/mysql srcs/mysql > /dev/null
echo "Building wordpress image..."
docker build -t services/wordpress srcs/wordpress > /dev/null
echo "Building phpmyadmin image..."
docker build -t services/phpmyadmin srcs/phpmyadmin > /dev/null
echo "Building influxdb image..."
docker build -t services/influxdb srcs/influxdb > /dev/null

echo "Applying manifests..."
kubectl apply -f srcs/manifests/metallb-namespace.yaml > /dev/null
kubectl apply -f srcs/manifests/metallb.yaml > /dev/null
kubectl apply -f srcs/manifests/metallb-config.yaml > /dev/null
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

kubectl apply -f srcs/manifests/nginx.yaml > /dev/null
kubectl apply -f srcs/manifests/mysql.yaml > /dev/null
kubectl apply -f srcs/manifests/wordpress.yaml > /dev/null
kubectl apply -f srcs/manifests/phpmyadmin.yaml > /dev/null
#kubectl apply -f srcs/manifests/influxdb.yaml > /dev/null

minikube dashboard &
echo "✅ ft_services deployment done"
