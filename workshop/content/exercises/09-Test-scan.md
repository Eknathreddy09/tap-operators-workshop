

```execute
sudo tanzu apps workload list -n tap-install
```

Edit scanpolicy

```editor:open-file
file: $HOME/scanpolicy.yaml
line: 16
```

Add severities to the file: "Critical"

ref Image: ![Scanpolicy](images/scanpolicy-1.png)

```execute
kubectl apply -f $HOME/scanpolicy.yaml -n tap-install
```

```execute
sudo tanzu apps workload create partnertapdemo-testscanpolicy  --git-repo https://github.com/Eknathreddy09/partnertapdemo-app --git-branch main --type web --label apps.tanzu.vmware.com/has-tests=true --label app.kubernetes.io/part-of=partnertapdemo -n tap-install --yes
```

```execute
tanzu apps workload apply partnertapdemo-testscanpolicy --annotation autoscaling.knative.dev/minScale=1 -n tap-install
```

```execute
sudo tanzu apps workload get partnertapdemo-testscanpolicy -n tap-install
```

```execute-2
sudo tanzu apps workload tail partnertapdemo-testscanpolicy -n tap-install
```

```dashboard:open-url
url: https://tap-gui.{{ session_namespace }}.demo.tanzupartnetdemo.com
```

Add ignore CVE's to the list:

```editor:open-file
file: $HOME/scanpolicy.yaml
line: 17
```

```execute
kubectl apply -f $HOME/scanpolicy.yaml -n tap-install
```

Wait for 2 mins

```execute
sudo tanzu apps workload get partnertapdemo-testscanpolicy -n tap-install
```

```dashboard:open-url
url: https://tap-gui.{{ session_namespace }}.demo.tanzupartnetdemo.com
```
