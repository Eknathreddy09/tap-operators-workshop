Supply Chain Choreographer is based on open source Cartographer. It allows App Operators to create pre-approved paths to production by integrating Kubernetes resources with the elements of their existing toolchains, for example, Jenkins.

Each pre-approved supply chain creates a paved road to production. Orchestrating supply chain resources - test, build, scan, and deploy - allows developers to focus on delivering value to their users and provides App Operators the assurance that all code in production has passed through all the steps of an approved workflow.

Out of the box supply chains are provided with Tanzu Application Platform and the following three supply chains are included: 

      Out of the Box Supply Chain Basic
      Out of the Box Supply Chain with Testing
      Out of the Box Supply Chain with Testing and Scanning
      
TAP also includes Out of the Box Templates and Out of the Box Delivery Basic. 

##### For this workshop, we have deployed TAP using OOTB supply chain with testing and scanning. 

```editor:open-file
file: ~/tap-values.yaml
line: 12
```

<p style="color:blue"><strong> List the supply chain list </strong></p>

```execute
tanzu apps cluster-supply-chain list
```

<p style="color:blue"><strong> Check the Scanpolicy resource </strong></p>

```execute
kubectl get ScanPolicy -n tap-install
```

<p style="color:blue"><strong> Check the Pipeline resource </strong></p>

```execute
kubectl get Pipeline -n tap-install
```

<p style="color:blue"><strong> Connect to TAP GUI </strong></p>

```dashboard:open-url
url: http://tanzu-java-web-app.tap-install.captainvirtualization.in
```

###### In Tap GUI, navigate to Supply Chain > Workloads > click on workload tanzu-java-web-app

![Local host](images/supply-1.png)

There are two sections within this view:

Graph view at the top, which shows all the configured CRDs used by this supply chain and any artifacts that are outputs of the supply chain’s execution

Stage details view at the bottom, which shows source data for each part of the supply chain that you select in the graph view

###### click on various stages in supply chain to understand better

![Local host](images/supply-2.png)

For more detailed info reg supply chains, please refer to official vmware doc: 

```dashboard:open-url
url: https://docs.vmware.com/en/Tanzu-Application-Platform/1.1/tap/GUID-scc-ootb-supply-chain-testing-scanning.html
```
