```dashboard:open-url
url: https://docs.vmware.com/en/VMware-Tanzu-Kubernetes-Grid/1.4/vmware-tanzu-kubernetes-grid-14/GUID-index.html
```

<p style="color:blue"><strong> Click here to test the execution in terminal</strong></p>

```execute-1
echo "Hello, Welcome to Partner workshop session"
```

###### Click here to check the Tanzu version

```execute
tanzu version
```

```execute
az --version
```

```execute
kubectl version
```

```execute-all
export SESSION_NAME={{ session_namespace }}
```

###### SE will provide the AZ Credentials, edit and execute in terminal

```copy-and-edit
az login --service-principal -u <App ID> -p <Password> --tenant <Tenent ID> 
```
###### SE will provide the Subscription ID, edit and execute in terminal

```copy-and-edit
az account set --subscription <subscriptionid>
```

```execute
az aks get-credentials --resource-group tap-partner-demo --name {{ session_namespace }}-cluster
```

```execute
kubectl create ns tap-install
```

```copy-and-edit
kubectl create secret docker-registry registry-credentials --docker-server=tappartnerdemoacr.azurecr.io --docker-username=tappartnerdemoacr --docker-password=<password> -n tap-install
```

```execute
cd $HOME/tanzu-cluster-essentials
```

```execute
./install.sh -y
```
