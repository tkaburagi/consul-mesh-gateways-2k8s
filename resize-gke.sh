#!/usr/bin/env bash

if [ $1 = 0 ]; then
  helm del --no-hooks consul 

  sleep 30

  gcloud container clusters resize consul-mesh-gateway-cluster-1 \
    --node-pool default-pool \
    --num-nodes $1 \
    --zone asia-northeast1-a

elif [ $1 = 3 ]; then
  gcloud container clusters resize consul-mesh-gateway-cluster-1 \
    --node-pool default-pool \
    --num-nodes $1 \
    --zone asia-northeast1-a

#    sleep 60
#
#    helm del $(helm ls --all --short)
#
#    helm install -f $2 consul hashicorp/consul --wait
#
#    kubectl get secret consul-federation -o yaml > consul-federation-secret.yaml

    kubectl get all
fi
