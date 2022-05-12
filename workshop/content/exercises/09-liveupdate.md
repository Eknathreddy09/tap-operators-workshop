
###### Navigate to cloned repo {{ session_namespace }}-tanzu-webapp in github

<p style="color:blue"><strong> Tail the logs in terminal-2 </strong></p>

```execute-2
tanzu apps workload tail tanzu-java-web-app --since 10m --timestamp -n tap-install
```

###### Change the text from "Greetings from Spring Boot + tanzu!" to anything like "Greetings from Spring Boot + Welcome to Partner demo" in below files of github repo

src/test/java/com/example/springboot/HelloControllerTest.java 
src/main/java/com/example/springboot/HelloController.java

###### Check the logs in terminal-2

<p style="color:blue"><strong> Verify the application status and wait for it to turn healthy </strong></p>

```execute-1
tanzu apps workload get tanzu-java-web-app -n tap-install
```

<p style="color:blue"><strong> Access the updated application </strong></p>

```dashboard:open-url
url: http://tanzu-java-web-app.tap-install.captainvirtualization.in
```

![Spring](images/liveup-1.png)
