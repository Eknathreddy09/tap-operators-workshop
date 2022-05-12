<p style="color:blue"><strong> Collect the load balancer IP </strong></p>

```execute
kubectl get svc envoy -n tanzu-system-ingress -o jsonpath='{.status.loadBalancer.ingress[0].ip}'
```

###### Add an entry in local host /etc/hosts path pointing the above collected load balancer IP with tap-gui.{{ session_namespace }}.demo.captainvirtualization.in

Example for ref: 
![Local host](images/tap-svc-localhost-1.png)

<p style="color:blue"><strong> Access TAP GUI </strong></p>

```dashboard:open-url
url: https://tap-gui.{{ session_namespace }}.demo.captainvirtualization.in
```

Example for ref: 
![TAP GUI](images/tap-gui-1.png)

