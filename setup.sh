#!/bin/sh

minikube start --driver=docker
eval $(minikube docker-env)

