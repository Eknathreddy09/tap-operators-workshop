
```execute
tanzu package available list metadata-store.apps.tanzu.vmware.com --namespace tap-install
```

```execute
kubectl get secret app-tls-cert -n metadata-store -o json | jq -r '.data."ca.crt"' | base64 -d > insight-ca.crt
```

```execute
METADATA_STORE_IP=$(kubectl get service/metadata-store-app --namespace metadata-store -o jsonpath="{.status.loadBalancer.ingress[0].ip}")
```

```execute
METADATA_STORE_PORT=$(kubectl get service/metadata-store-app --namespace metadata-store -o jsonpath="{.spec.ports[0].port}")
```

```execute
METADATA_STORE_DOMAIN="metadata-store-app.metadata-store.svc.cluster.local"
```

```execute
echo "$METADATA_STORE_IP $METADATA_STORE_DOMAIN" | sudo tee -a /etc/hosts > /dev/null
```

```execute
tanzu insight config set-target https://$METADATA_STORE_DOMAIN:$METADATA_STORE_PORT --ca-cert insight-ca.crt
```

```execute
tanzu insight health
```

```execute
kubectl apply -f metadata-store.yaml
```

```execute
kubectl get secret $(kubectl get sa -n metadata-store metadata-store-read-write-client -o json | jq -r '.secrets[0].name') -n metadata-store -o json | jq -r '.data.token' | base64 -d
```

```execute
export METADATA_STORE_ACCESS_TOKEN=$(kubectl get secrets -n metadata-store -o jsonpath="{.items[?(@.metadata.annotations['kubernetes\.io/service-account\.name']=='metadata-store-read-write-client')].data.token}" | base64 -d)
```

```execute
tanzu insight image add --cyclonedxtype xml --path $HOME/image-cve-report
```

```execute
tanzu insight vuln get --cveid CVE-2020-16156
```

```execute
tanzu insight vuln images --cveid CVE-2020-16156
```

```execute
tanzu insight package images --name perl-base
```

```execute
tanzu insight image get --digest sha256:eb23306afab28c48bb9e3ae2b8fbff35e20d3da5016779317665ea448846efb1
```

