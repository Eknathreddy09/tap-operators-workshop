Application Accelerator for VMware Tanzu helps you bootstrap developing and deploying your applications in a discoverable and repeatable way.

Enterprise Architects author and publish accelerator projects that provide developers and operators with ready-made, enterprise-conformant code and configurations. You can then use Application Accelerator to create new projects based on those accelerator projects.

The Application Accelerator user interface (UI) enables you to discover available accelerators, configure them, and generate new projects to download.

<p style="color:blue"><strong> Connect to TAP GUI </strong></p>

```dashboard:open-url
url: http://tap-gui.{{ session_namespace }}.demo.captainvirtualization.in
```

###### Click on Accelerators (+), to check the available accelerators

##### Create a new Accelerator

<p style="color:blue"><strong> Access spring.io </strong></p>

```dashboard:open-url
url: https://start.spring.io/
```
###### Provide Artifact and Name as below, remaining leave as default

Artifact: {{ session_namespace }}
Name: {{ session_namespace }}

<p style="color:blue"><strong> Generate</strong></p>

![Spring](images/spring.png)

###### Extract the generated zip file and upload the content into a new repo. create a new repo with name as {{ session_namespace }}-acc


###### Add the accelearor.yaml file to the root folder of repo as shown below

```execute
cat accelerator.yaml
```

Optional: After you’ve downloaded the ZIP file, expand it and modify the code using any IDE. 

![Git repo](images/acc-3.png)

<p style="color:blue"><strong> provide git account name and execute </strong></p>

```copyandedit
tanzu acc create demoapp --git-repository  https://github.com/<GIT Account>/{{ session_namespace }}-acc --git-branch main
```

###### Navigate to TAP-GUI > Accelerators > You should see a new Accelerator ({{ session_namespace }}) created with a smiley icon as shown below: 

![Git repo](images/acc-4.png)
