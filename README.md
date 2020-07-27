![](2k8s.png)
![](2k8s-2.png)

on gke
```shell script
kc get secret consul-federation -o yaml > consul-federation-secret.yaml
```

on eks
```shell script
kc apply -f consul-federation-secret.yaml
```

```shell script
eksctl create cluster \
    --name=consul-mesh-gateway-cluster-2 \
    --nodes=3 \
    --node-ami=auto \
    --region=ap-northeast-1 \
    --version 1.17
```