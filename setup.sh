#!/bin/sh

function version { echo "$@" | awk -F. '{ printf("%d%03d%03d%03d\n", $1,$2,$3,$4); }'; }

MINIKUBE_VERSION=$(minikube version | grep version | cut -d " " -f3 | tr -d "v")

if [ $(version $MINIKUBE_VERSION) -eq $(version "1.9.0") ]; then
  echo "Minikube version is v1.9.0."
else
  echo "Your Minikube version is not v1.9.0 (like official 42 Xubuntu VM). Installing Minikube version v1.9.0..."
  curl -LO https://storage.googleapis.com/minikube/releases/v1.9.0/minikube-linux-amd64
  chmod +x minikube-linux-amd64
  alias minikube=./minikube-linux-amd64
fi

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
