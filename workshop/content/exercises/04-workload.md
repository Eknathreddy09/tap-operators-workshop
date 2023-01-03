<p style="color:blue"><strong> Review below yaml files </strong></p>

```execute
cat $HOME/developer.yaml
```

```execute
cat $HOME/tekton-pipeline.yaml
```

```execute
cat $HOME/scanpolicy.yaml
```

<p style="color:blue"><strong> Setup developer namespace </strong></p>

```execute
kubectl apply -f $HOME/developer.yaml -n tap-install
```

<p style="color:blue"><strong> Deploy Tekton pipeline </strong></p>

```execute
kubectl apply -f $HOME/tekton-pipeline.yaml -n tap-install
```

<p style="color:blue"><strong> Deploy Scanpolicy </strong></p>

```execute
kubectl apply -f $HOME/scanpolicy.yaml -n tap-install
```

<p style="color:blue"><strong> List the packages installed </strong></p>

```execute
sudo tanzu package installed list -A
```

###### Execute the below Auto heal script

```
source ~/autoheal.sh
```

```execute
sudo tanzu package installed list -A
```

![Installed Package](images/install-5.png)

###### If all the packages are installed successfully, now its time to deploy an application on TAP. Provide the gitrepo that you have forked in the beginning. 


```execute
sudo tanzu apps workload create {{ session_namespace }}  --git-repo https://gitea-tapdemo.tap.tanzupartnerdemo.com/tapdemo-user/partnertapdemo --git-branch main --type web --label apps.tanzu.vmware.com/has-tests=true --label app.kubernetes.io/part-of=partnertapdemo -n tap-install --yes
```

<p style="color:blue"><strong> Get the status of deployed application </strong></p>

```execute
sudo tanzu apps workload get {{ session_namespace }} -n tap-install
```

*Note:* Ignore below error, it is expected. 

![Workload](images/workload-1.png)

<p style="color:blue"><strong> Check the live progress of application</strong></p>

```execute-2
sudo tanzu apps workload tail {{ session_namespace }} --since 10m --timestamp -n tap-install
```

<p style="color:blue"><strong> Check all the installed applications </strong></p>

```execute
sudo tanzu apps workload list -n tap-install
```

<p style="color:blue"><strong> Get the pods in tap-install namespace </strong></p>

```execute
kubectl get pods -n tap-install
```

###### Note: Workload creation takes 5 mins to complete, proceed further once you see ready status

```execute
sudo tanzu apps workload get {{ session_namespace }} -n tap-install
```

![Workload](images/workload-2.png)

###### Apply Annotation

```execute
tanzu apps workload apply {{ session_namespace }} --annotation autoscaling.knative.dev/minScale=1 -n tap-install -y
```

```terminal:interrupt
session: 2
```

<p style="color:blue"><strong> Collect the load balancer IP </strong></p>

```execute
kubectl get svc envoy -n tanzu-system-ingress -o jsonpath='{.status.loadBalancer.ingress[0].ip}'
```

###### Add an entry in local host /etc/hosts path pointing the above collected load balancer IP with {{ session_namespace }}.tap-install.{{ session_namespace }}.demo.tanzupartnerdemo.com

![Workload](images/tap-workload-4.png)

<p style="color:blue"><strong> Access the deployed application </strong></p>

```dashboard:open-url
url: http://{{ session_namespace }}.tap-install.{{ session_namespace }}.demo.tanzupartnerdemo.com
```

![Workload](images/workload-3.png)


### Pre-build image: 

```dashboard:open-url
url: https://docs.vmware.com/en/VMware-Tanzu-Application-Platform/1.3/tap/GUID-scc-pre-built-image.html
```

```execute
sudo tanzu apps workload list -n tap-install
```

Note: Image is already created for this workshop and uploaded to ACR. 

```execute
tanzu apps workload create {{ session_namespace }}-fromimage --image tapworkshopoperators.azurecr.io/tap13/workshopimage/partnertapdemo-tap-install:latest --type web --app {{ session_namespace }}-fromimage -n tap-install -y
```

```execute
sudo tanzu apps workload get {{ session_namespace }}-fromimage -n tap-install
```

```execute-2
tanzu apps workload tail {{ session_namespace }}-fromimage --namespace tap-install
```

![Workload from Image](images/fromimage-1.png)


<p style="color:blue"><strong> Collect the load balancer IP </strong></p>

```execute
kubectl get svc envoy -n tanzu-system-ingress -o jsonpath='{.status.loadBalancer.ingress[0].ip}'
```

![Workload from Image](images/fromimage-2.png)

###### Add an entry in local host /etc/hosts path pointing the above collected load balancer IP with {{ session_namespace }}-fromimage.tap-install.{{ session_namespace }}.demo.tanzupartnerdemo.com

![Workload from Image](images/fromimage-3.png)

<p style="color:blue"><strong> Access the deployed application </strong></p>

```dashboard:open-url
url: http://{{ session_namespace }}-fromimage.tap-install.{{ session_namespace }}.demo.tanzupartnerdemo.com
```

![Workload from Image](images/fromimage-4.png)

```terminal:interrupt
session: 2
```

