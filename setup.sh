#!/bin/sh

minikube start --driver=docker

export CLUSTER_IP=$(minikube ip)
echo "Cluster IP: ${CLUSTER_IP}"

eval $(minikube docker-env)
echo "Building nginx image..."
docker build -t services/nginx srcs/nginx > /dev/null
echo "Building mysql image..."
docker build -t services/mysql srcs/mysql > /dev/null

echo "Applying manifests..."
kubectl apply -f srcs/manifests/metallb-namespace.yaml > /dev/null
kubectl apply -f srcs/manifests/metallb.yaml > /dev/null
kubectl apply -f srcs/manifests/metallb-config.yaml > /dev/null
kubectl apply -f srcs/manifests/nginx.yaml > /dev/null
kubectl apply -f srcs/manifests/mysql.yaml > /dev/null

minikube dashboard &
echo "✅ ft_services deployment done"
