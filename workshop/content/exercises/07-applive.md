The Application Live View features of the Tanzu Application Platform include sophisticated components to give developers and operators a view into their running workloads on Kubernetes.

Application Live View shows an individual running process

<p style="color:blue"><strong> Connect to TAP GUI </strong></p>

```dashboard:open-url
url: https://tap-gui.{{ session_namespace }}.demo.tanzupartnetdemo.com
```

###### In Tap GUI, Naviate to Home > Your Organization > All > tanzu-java-web-app

![Local host](images/tap-gui-2.png)

###### Runtime Resources > Resources > click on tanzu-java-web-app

![Local host](images/Applive-1.png)

###### Scroll down to the bottom and click on pod deployment

![Local host](images/Applive-2.png)

###### Live view of application can be seen as shown below: 

![Local host](images/Applive-3.png)

###### Change the information Category to Memory, to view the memory stats if application. 

![Local host](images/Applive-4.png)

<p style="color:blue"><strong> Access AppLive view page directly: </strong></p>

```dashboard:open-url
url: https://tap-gui.{{ session_namespace }}.demo.tanzupartnetdemo.com/app-live-view
```

refer: 

https://docs.vmware.com/en/Application-Live-View-for-VMware-Tanzu/1.2/docs/GUID-product-features.html
