Tanzu Application Platform GUI is a tool for your developers to view your applications and services running for your organization. This portal provides a central location in which you can view dependencies, relationships, technical documentation, and the service status.
Tanzu Application Platform GUI consists of the following components:

Tanzu Application Platform GUI plug-ins:

   - Runtime Resources Visibility
  
   - Application Live View
  
   - Application Accelerator
  
   - API Documentation
  
   - Supply Chain Choreographer

   - TechDocs

###### In this section, lets see how to access TAP-GUI once installed with full profile. 

<p style="color:blue"><strong> Verify the pods in tap-gui namespace </strong></p>

```execute
kubectl get pods -n tap-gui
```

<p style="color:blue"><strong> Collect the load balancer IP </strong></p>

```execute
kubectl get svc envoy -n tanzu-system-ingress -o jsonpath='{.status.loadBalancer.ingress[0].ip}'
```

###### Add an entry in local host /etc/hosts path pointing the above collected load balancer IP with tap-gui.{{ session_namespace }}.demo.tanzupartnerdemo.com

Example for ref: 

![TAP GUI](images/gui-1.png)

<p style="color:blue"><strong> Access TAP GUI </strong></p>

```dashboard:open-url
url: http://tap-gui.{{ session_namespace }}.demo.tanzupartnerdemo.com
```

Example for ref: 

![TAP GUI](images/gui-2.png)

##### Integrate Auth (Github) with TAP GUI: 

*Note:* Steps to create your own *client ID*, *client secret* in github are given in below TechDocs page: 

```dashboard:open-url
url: https://tap-gui.workshop.tap.tanzupartnerdemo.com/docs/default/component/tap-gui-component/github-settings/
```

###### Remove (#) from lines 69 - 75

```editor:open-file
file: ~/tap-values.yaml
```

![TAP GUI](images/gui-3.png)

Replace provideyourclientid with your Github client ID. 

```editor:open-file
file: ~/tap-values.yaml
line: 74
```

Replace provideyourcliensecret with your Github client Secret. 

```editor:open-file
file: ~/tap-values.yaml
line: 75
```

###### Update TAP packages with updated values: 

```execute
sudo tanzu package installed update tap -f $HOME/tap-values.yaml -n tap-install
```

###### Access the TAP GUI, open in incognito window or a different browser. 

```dashboard:open-url
url: http://tap-gui.{{ session_namespace }}.demo.tanzupartnerdemo.com
```

###### Authenticate to TAP GUI portal with your github credentials. 

![TAP GUI](images/gui-4.png)

![TAP GUI](images/gui-5.png)
