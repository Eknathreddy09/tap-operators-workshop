
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

###### Check below repo to view the workload content: 

```dashboard:open-url
url: https://gitea-tapdemo.tap.tanzupartnerdemo.com/tapdemo-user/tanzu-java-web-app
```

######  AZ Login command to connect to Azure

```execute
az login 
```

###### Set the subscription

```execute
az account set --subscription 
```

###### Provide ACR repo password and execute

```execute
export DOCKER_REGISTRY_PASSWORD=
```

###### Create Kubernetes cluster with 3 nodes and it should take around 5-10 mins to complete, please wait for it to deploy successfully. 
 
```execute
az aks create --resource-group tapdemo-cluster-RG --name {{ session_namespace }}-cluster --subscription a3ac57b4-348f-471f-9938-9cf757e2d033 --node-count 3 --enable-addons monitoring --generate-ssh-keys --node-vm-size Standard_B8ms -z 1 --enable-cluster-autoscaler --min-count 3 --max-count 3
```

<p style="color:blue"><strong> Get credentials of cluster"{{ session_namespace }}-cluster" </strong></p>

```execute
az aks get-credentials --resource-group tapdemo-cluster-RG --name {{ session_namespace }}-cluster
```
  
<p style="color:blue"><strong> Docker login to image repo </strong></p>

```execute
docker login tapworkshopoperators.azurecr.io -u tapworkshopoperators -p $DOCKER_REGISTRY_PASSWORD
```

<p style="color:blue"><strong> Check if the current context is set to "{{ session_namespace }}-cluster" </strong></p>

```execute
kubectl config get-contexts
```

![Cluster Context](images/prepare-1.png)

<p style="color:blue"><strong> Create a namespace </strong></p>

```execute
kubectl create ns tap-install
```

<p style="color:blue"><strong> Set environment variable </strong></p>

![Env](images/prepare-2.png)

```execute
export INSTALL_BUNDLE=registry.tanzu.vmware.com/tanzu-cluster-essentials/cluster-essentials-bundle@sha256:54bf611711923dccd7c7f10603c846782b90644d48f1cb570b43a082d18e23b9
export INSTALL_REGISTRY_HOSTNAME=registry.tanzu.vmware.com
```

<p style="color:blue"><strong> Provide Tanzu network username and execute in terminal </strong></p>
  
*Note:* Just click on below command and paste in terminal 1, provide your <Tanzu Network Registry username> and press *ENTER* 

```copy-and-edit
export INSTALL_REGISTRY_USERNAME=<Tanzu Network Registry username>
```

<p style="color:blue"><strong> Provide the Tanzu network password and execute in terminal </strong></p>
  
*Note:* Just click on below command and paste in terminal 1, provide your <Tanzu Network password> and press *ENTER* 

```copy-and-edit
export INSTALL_REGISTRY_PASSWORD=<Tanzu Network password>
```

```execute
cd $HOME/tanzu-cluster-essentials
```

<p style="color:blue"><strong> Install cluster essentials in {{ session_namespace }}-cluster  </strong></p>

```execute
./install.sh -y
```

![Cluster Essentials](images/prepare-3.png)

<p style="color:blue"><strong> Create tap-registry secret </strong></p>

```execute
sudo tanzu secret registry add tap-registry --username tapworkshopoperators --password $DOCKER_REGISTRY_PASSWORD --server tapworkshopoperators.azurecr.io --export-to-all-namespaces --yes --namespace tap-install
```

![Secret Tap Registry](images/prepare-4.png)

```execute
kubectl create secret docker-registry registry-credentials --docker-server=tapworkshopoperators.azurecr.io --docker-username=tapworkshopoperators --docker-password=$DOCKER_REGISTRY_PASSWORD -n tap-install
```

![Secret Registry Credentials](images/prepare-5.png)

<p style="color:blue"><strong> Verify the pods in kapp-controller namespace  and secretgen-controller </strong></p>

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
sed -i -r "s/password-registry/$DOCKER_REGISTRY_PASSWORD/g" $HOME/autoheal.sh
```

```execute
sed -i -r "s/SESSION_NAME/$SESSION_NAME/g" $HOME/tap-values.yaml
```
