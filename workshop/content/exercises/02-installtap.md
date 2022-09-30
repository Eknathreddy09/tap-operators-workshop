<p style="color:blue"><strong> Review Tap values file </strong></p>

```execute
cat $HOME/tap-values.yaml
```

<p style="color:blue"><strong> Add the package repository </strong></p>

```execute
sudo tanzu package repository add tanzu-tap-repository --url tappartnerdemoacr.azurecr.io/tap-demo/tap-packages122:1.2.2 --namespace tap-install
```

![Local host](images/tap-install-1.png)

<p style="color:blue"><strong> Get the status of the TAP package repository, and ensure the status updates to Reconcile succeeded </strong></p>

```execute
sudo tanzu package repository get tanzu-tap-repository --namespace tap-install
```

![Local host](images/tap-install-2.png)

<p style="color:blue"><strong>  List the available packages </strong></p>

```execute
sudo tanzu package available list --namespace tap-install
```

<p style="color:blue"><strong> Install Tanzu package with full profile</strong></p>

```execute
sudo tanzu package install tap -p tap.tanzu.vmware.com -v 1.2.2 --values-file $HOME/tap-values.yaml -n tap-install
```

![Local host](images/tap-install-3.png)

Note: This process takes about 5-10 mins to complete. If you see any reconcile errors, please let us know.

<p style="color:blue"><strong> List the packages installed </strong></p>

```execute
sudo tanzu package installed list -A
```

<p style="color:red"><strong> Proceeed further only once all the packages are reconciled successfully </strong></p>

![Local host](images/tap-install-4.png)
