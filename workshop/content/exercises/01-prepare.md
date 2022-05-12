
<p style="color:blue"><strong> Click here to test the execution in terminal</strong></p>

```execute-1
echo "Hello, Welcome to Partner workshop session"
```

<p style="color:blue"><strong> Click here to check the Tanzu version</strong></p>

```execute
tanzu version
```
<p style="color:blue"><strong> Click here to check the AZ version</strong></p>

```execute
az --version
```

<p style="color:blue"><strong> Click here to check the kubectl version</strong></p>

```execute
kubectl version
```

<p style="color:blue"><strong> Set environment variable </strong></p>

```execute-all
export SESSION_NAME={{ session_namespace }}
```

###### Login to github and fork the below repo, give the repository name as {{ session_namespace }}

```dashboard:open-url
url: https://github.com/Eknathreddy09/tanzu-java-web-app
```

###### SE will provide the AZ Credentials, edit and execute in terminal

```copy-and-edit
az login --service-principal -u <App ID> -p <Password> --tenant <Tenent ID> 
```
###### SE will provide the Subscription ID, edit and execute in terminal

```copy-and-edit
az account set --subscription <subscriptionid>
```

###### Provide ACR repo password and execute

```copy-and-edit
export DOCKER_REGISTRY_PASSWORD=<ACR Repo password>
```

<p style="color:blue"><strong> Get credentials of cluster"{{ session_namespace }}-cluster" </strong></p>

```execute
az aks get-credentials --resource-group tapdemo-cluster-RG --name {{ session_namespace }}-cluster
```

<p style="color:blue"><strong> Check if the current context is set to "{{ session_namespace }}-cluster" </strong></p>

```execute
kubectl config get-contexts
```

<p style="color:blue"><strong> Create a namespace </strong></p>

```execute
kubectl create ns tap-install
```

<p style="color:blue"><strong> Create secret registry-credentials </strong></p>

```execute
kubectl create secret docker-registry registry-credentials --docker-server=tappartnerdemoacr.azurecr.io --docker-username=tappartnerdemoacr --docker-password=$DOCKER_REGISTRY_PASSWORD -n tap-install
```

<p style="color:blue"><strong> Set environment variable </strong></p>

```execute
export INSTALL_BUNDLE=registry.tanzu.vmware.com/tanzu-cluster-essentials/cluster-essentials-bundle@sha256:ab0a3539da241a6ea59c75c0743e9058511d7c56312ea3906178ec0f3491f51d
export INSTALL_REGISTRY_HOSTNAME=registry.tanzu.vmware.com
```

<p style="color:blue"><strong> Provide Tanzu network username and execute in terminal </strong></p>

```copy-and-edit
export INSTALL_REGISTRY_USERNAME=<Tanzu Network Registry username>
```

<p style="color:blue"><strong> Provide the Tanzu network password and execute in terminal </strong></p>

```copy-and-edit
export INSTALL_REGISTRY_PASSWORD=<Tanzu Network password>
```

```execute
cd $HOME/tanzu-cluster-essentials
```

<p style="color:blue"><strong> Install cluster essesntials in {{ session_namespace }}-cluster  </strong></p>

```execute
./install.sh -y
```

<p style="color:blue"><strong> Verify the pods in kapp-controller namespace  </strong></p>

```execute
kubectl get pods -n kapp-controller
```

```execute
kubectl get pods -n secretgen-controller
```

<p style="color:blue"><strong> Docker login to image repo </strong></p>

```execute
docker login tappartnerdemoacr.azurecr.io -u tappartnerdemoacr -p $DOCKER_REGISTRY_PASSWORD
```

<p style="color:blue"><strong> docker login to VMware registry </strong></p>

```execute
docker login registry.tanzu.vmware.com -u $INSTALL_REGISTRY_USERNAME -p $INSTALL_REGISTRY_PASSWORD
```

<p style="color:blue"><strong> Create tap-registry secret  </strong></p>

```execute
sudo tanzu secret registry add tap-registry --username tappartnerdemoacr --password $DOCKER_REGISTRY_PASSWORD --server tappartnerdemoacr.azurecr.io --export-to-all-namespaces --yes --namespace tap-install
```

<p style="color:blue"><strong> Copy the output and same will be updated in tap-values files </strong></p>

```execute-1
echo $DOCKER_REGISTRY_PASSWORD
```

<p style="color:blue"><strong> Provide ACR repo password collected in previous step and replace password </strong></p>

```editor:open-file
file: ~/tap-values.yaml
line: 6
```

Ref: 

![Local host](images/values-3.png)

<p style="color:blue"><strong> Replace tanzunetusername with your VMware Tanzu network username </strong></p>

```editor:open-file
file: ~/tap-values.yaml
line: 7
```

<p style="color:blue"><strong> Replace tanzunetpassword with your VMware Tanzu network password </strong></p>

```editor:open-file
file: ~/tap-values.yaml
line: 8
```
<p style="color:blue"><strong> Replace $SESSION_NAME with "{{ session_namespace }}" </strong></p>

```editor:open-file
file: ~/tap-values.yaml
line: 15
```

<p style="color:blue"><strong> Replace $SESSION_NAME with "{{ session_namespace }}" </strong></p>

```editor:open-file
file: ~/tap-values.yaml
line: 23
```

<p style="color:blue"><strong> Replace $SESSION_NAME with "{{ session_namespace }}" </strong></p>

```editor:open-file
file: ~/tap-values.yaml
line: 33
```

<p style="color:blue"><strong> Replace $SESSION_NAME with "{{ session_namespace }}" </strong></p>

```editor:open-file
file: ~/tap-values.yaml
line: 36
```

<p style="color:blue"><strong> Provide your github token </strong></p>

```editor:open-file
file: ~/tap-values.yaml
line: 40
```

<p style="color:blue"><strong> Provide the Git account and repo name. Replace gitname with your account name and reponame with {{ session_namespace }} </strong></p>

```editor:open-file
file: ~/tap-values.yaml
line: 44
```
<p style="color:blue"><strong> Replace $SESSION_NAME with "{{ session_namespace }}" </strong></p>

```editor:open-file
file: ~/tap-values.yaml
line: 46
```

<p style="color:blue"><strong> Replace $SESSION_NAME with "{{ session_namespace }}" </strong></p>

```editor:open-file
file: ~/tap-values.yaml
line: 48
```

Ref:

![Local host](images/values-4.png)
