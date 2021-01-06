#!/usr/bin/env bash

if [ $1 = 0 ]; then
  helm del --no-hooks consul 

  sleep 30

  eksctl delete cluster \
      --name consul-mesh-gateway-cluster-2 \
      --wait

elif [ $1 = 3 ]; then
  eksctl create cluster \
    --name=consul-mesh-gateway-cluster-2 \
    --nodes=$1 \
    --node-ami=auto \
    --region=ap-northeast-1 \
    --version=1.16

    sleep 60

    aws eks --region ap-northeast-1 update-kubeconfig --name consul-mesh-gateway-cluster-2

    kubectl apply -f consul-federation-secret.yaml

    helm install -f $2 consul hashicorp/consul --wait

    kubectl get all

fi
