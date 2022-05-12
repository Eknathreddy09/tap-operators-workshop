```execute
cat $HOME/tap-values.yaml
```

<p style="color:blue"><strong> Add the package repository </strong></p>

```execute
sudo tanzu package repository add tanzu-tap-repository --url tappartnerdemoacr.azurecr.io/tap-demo/tap-packages:1.1.0 --namespace tap-install
```

<p style="color:blue"><strong> Get the available packages </strong></p>

```execute
sudo tanzu package repository get tanzu-tap-repository --namespace tap-install
```

```execute
sudo tanzu package available list --namespace tap-install
```

<p style="color:blue"><strong> Install Tanzu package </strong></p>

```execute
sudo tanzu package install tap -p tap.tanzu.vmware.com -v 1.1.0 --values-file $HOME/tap-values.yaml -n tap-install
```
<p style="color:blue"><strong> List the packages installed </strong></p>

```execute
tanzu package installed list -A
```

image: expected

<p style="color:blue"><strong> Check the reconcile status of tap package </strong></p>

```execute
tanzu package installed get tap -n tap-install
```
