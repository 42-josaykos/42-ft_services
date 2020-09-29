#!/bin/sh

minikube start --driver=docker
minikube addons enable dashboard

export CLUSTER_IP=$(minikube ip)
echo "Cluster IP: ${CLUSTER_IP}"

eval $(minikube docker-env)
echo "Building nginx image..."
docker build -t ft_services/nginx srcs/nginx > /dev/null

echo "Applying manifests..."
kubectl apply -f srcs/manifests/metallb-namespace.yaml > /dev/null
kubectl apply -f srcs/manifests/metallb.yaml > /dev/null
kubectl apply -f srcs/manifests/metallb-config.yaml > /dev/null
kubectl apply -f srcs/manifests/nginx.yaml > /dev/null

echo "✅ ft_services deployment done"
minikube dashboard &
