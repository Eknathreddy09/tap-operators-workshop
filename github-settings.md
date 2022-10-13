#### Steps to generate Client ID and Client Secret in GitHub: 

###### Login to GitHub by accessing below url: 

```dashboard:open-url
url: https://github.com/settings/apps
```

###### Click on New GitHub App

![GitHub](github-1.png)

###### Provide GitHub App name, for ex: tapgui-auth-tapdemo

Homepage URL: https://github.com/login/oauth/authorize

Note: Replace { tap session id } with session id of your workshop, Call back url should be the TAP GUI url followed by /api/auth/github

Call back url: http://tap-gui.{ tap session id }.demo.tanzupartnerdemo.com/api/auth/github
  
###### Uncheck the Expire user authorization tokens under Callback URL

##### Uncheck the Active box under Webhook

![GitHub](github-2.png)

###### Scroll down to bottom of the page and Click on Create GitHubApp

###### Once registration is successful, create a new client secret using below steps: 

![GitHub](github-3.png)

###### Copy the client ID and client secret into a notepad for later use. 

![GitHub](github-4.png)
