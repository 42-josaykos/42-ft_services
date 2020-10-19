#!/bin/sh

minikube start --driver=docker

export CLUSTER_IP=$(kubectl get node -o=custom-columns='DATA:status.addresses[0].address' | sed -n 2p)
echo "Cluster IP: ${CLUSTER_IP}"

eval $(minikube docker-env)
echo "Building nginx image..."
docker build -t services/nginx srcs/nginx > /dev/null
echo "Building mysql image..."
docker build -t services/mysql srcs/mysql > /dev/null
echo "Building wordpress image..."
docker build -t services/wordpress srcs/wordpress > /dev/null

echo "Applying manifests..."
kubectl apply -f srcs/manifests/metallb-namespace.yaml > /dev/null
kubectl apply -f srcs/manifests/metallb.yaml > /dev/null
kubectl apply -f srcs/manifests/metallb-config.yaml > /dev/null
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

kubectl apply -f srcs/manifests/nginx.yaml > /dev/null
kubectl apply -f srcs/manifests/mysql.yaml > /dev/null

minikube dashboard &
echo "✅ ft_services deployment done"
