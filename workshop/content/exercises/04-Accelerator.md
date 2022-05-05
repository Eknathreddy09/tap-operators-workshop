

```dashboard:open-url
url: https://tap-gui.{{ session_namespace }}.demo.captainvirtualization.in
```

```dashboard:open-url
https://start.spring.io/
```
remaining leave as default

Artifact: {{ session_namespace }}
Name: {{ session_namespace }}

Generate

![Spring](images/spring.png)

Extract the generated zip file and upload the content into a new repo. create a new repo with name as {{ session_namespace }}
Add the accelearor.yaml file to the root folder as shown below

```execute
accelerator.yaml
```

![Git repo](images/acc-3.png)

change the repo and execute

```copyandedit
tanzu acc create demoapp --git-repository  https://github.com/<GIT Account>/partnersetap-w01-s001 --git-branch main
```

Navigate to TAP-GUI > Accelerators > You should see a new Accelerator ({{ session_namespace }}) created with a smiley icon as shown below: 

![Git repo](images/acc-4.png)
