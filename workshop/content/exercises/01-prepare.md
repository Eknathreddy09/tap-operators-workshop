
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

<p style="color:blue"><strong> Docker login to image repo </strong></p>

```execute
docker login tappartnerdemoacr.azurecr.io -u tappartnerdemoacr -p $DOCKER_REGISTRY_PASSWORD
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

<p style="color:blue"><strong> Set environment variable </strong></p>

```execute
export INSTALL_BUNDLE=registry.tanzu.vmware.com/tanzu-cluster-essentials/cluster-essentials-bundle@sha256:54bf611711923dccd7c7f10603c846782b90644d48f1cb570b43a082d18e23b9
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

```copy-and-edit
export GIT_HUB_TOKEN=< github token>
```

```execute
cd $HOME/tanzu-cluster-essentials
```

<p style="color:blue"><strong> Install cluster essesntials in {{ session_namespace }}-cluster  </strong></p>

```execute
./install.sh -y
```

<p style="color:blue"><strong> Create tap-registry secret  </strong></p>

```execute
sudo tanzu secret registry add tap-registry --username tappartnerdemoacr --password $DOCKER_REGISTRY_PASSWORD --server tappartnerdemoacr.azurecr.io --export-to-all-namespaces --yes --namespace tap-install
```

```execute
kubectl create secret docker-registry registry-credentials --docker-server=${INSTALL_REGISTRY_HOSTNAME} --docker-username=${INSTALL_REGISTRY_USERNAME} --docker-password=${INSTALL_REGISTRY_PASSWORD} -n tap-install
```

<p style="color:blue"><strong> Verify the pods in kapp-controller namespace  </strong></p>

```execute
kubectl get pods -n kapp-controller
```

```execute
kubectl get pods -n secretgen-controller
```

<p style="color:blue"><strong> Changes to tap values file" </strong></p>

```execute
sed -i -r "s/password-registry/$DOCKER_REGISTRY_PASSWORD/g" $HOME/tap-values.yaml
```

```execute
sed -i -r "s/SESSION_NAME/$SESSION_NAME/g" $HOME/tap-values.yaml
```

```execute
sed -i -r "s/githubtoken/$GIT_HUB_TOKEN/g" $HOME/tap-values.yaml
GIT_HUB_TOKEN
```

<p style="color:blue"><strong> Provide the Git account and repo name. Replace gitname with your account name and reponame with {{ session_namespace }} </strong></p>

Note: Gitea token and url

Ref:


