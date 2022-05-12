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

<p style="color:blue"><strong> Install grype scanner package </strong></p>

```execute
sudo tanzu package install grype-scanner --package-name grype.scanning.apps.tanzu.vmware.com --version 1.0.0  --namespace tap-install -f $HOME/ootb-supply-chain-basic-values.yaml
```

<p style="color:blue"><strong> List the packages installed </strong></p>

```execute
tanzu package installed list -A
```

###### If all the packages are installed successfully, now its time to deploy an application on TAP. Provide the gitrepo that you have forked in the beginning. 


```copy-and-edit
sudo tanzu apps workload create tanzu-java-web-app  --git-repo <replace me with your git repo path to repo {{ session_namespace }}> --git-branch main --type web --label apps.tanzu.vmware.com/has-tests=true --label app.kubernetes.io/part-of=tanzu-java-web-app -n tap-install --yes
```

<p style="color:blue"><strong> Get the status of deployed application </strong></p>

```execute
sudo tanzu apps workload get tanzu-java-web-app -n tap-install
```

<p style="color:blue"><strong> Check the live progress of application</strong></p>

```execute-2
sudo tanzu apps workload tail tanzu-java-web-app --since 10m --timestamp -n tap-install
```

<p style="color:blue"><strong> Check all the installed applications </strong></p>

```execute
sudo tanzu apps workload list -n tap-install
```

<p style="color:blue"><strong> Get the status of deployed application, status should be ready with an url as shown in screenshot below </strong></p>

```execute
sudo tanzu apps workload get tanzu-java-web-app -n tap-install
```

![Local host](images/tap-workload-2.png)

<p style="color:blue"><strong> Get the pods in tap-install namespace </strong></p>

```execute
kubectl get pods -n tap-install
```

###### Note: Workload creation takes 5 mins to complete, proceed further once you see ready status

```execute
sudo tanzu apps workload get tanzu-java-web-app -n tap-install
```

![Local host](images/workload-create.png)

<p style="color:blue"><strong> Collect the load balancer IP </strong></p>

```execute
kubectl get svc envoy -n tanzu-system-ingress -o jsonpath='{.status.loadBalancer.ingress[0].ip}'
```

###### Add an entry in local host /etc/hosts path pointing the above collected load balancer IP with tanzu-java-web-app.tap-install.captainvirtualization.in

![Local host](images/tap-workload-4.png)

<p style="color:blue"><strong> Access the deployed application </strong></p>

```dashboard:open-url
url: http://tanzu-java-web-app.tap-install.captainvirtualization.in
```

![Local host](images/tap-workload-3.png)
