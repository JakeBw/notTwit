# Twitter Clone 

This project was started as a way to learn more about Swift, using xcode and firebase. So far the ios eco system has made things very confusing, every guide / instructed course / blog post I have read on making this is full of deprecated code making it a little more challenging. Anchoring UI elements to another has been a ton of build - start - stop - edit - build - start - stop.

## Features
- Registering new users with a fullname, user, email, password and profile picture
- Login to created accounts
- Create new tweets
- Update the main feed to show all new tweets instantly with the associated user details with it

## Features Being Developed
- Click profile pictures on the main feed and go to their user profile
- Search feature to find other accounts
- Fix feed to display only followed users posts and sort them by newest
- Setup notifications
- Add direct messaging for accounts that follow each other
- User settings
- Logout button 
## Deployment - Firebase
 
- Create an account on [Firebase](https://console.firebase.google.com)
- Start a project with whatever name you like
- Once your project has been created, select the iOS icon on the front page
- For the apple bundle ID, look for it in your xcode project, the projects default is "home.notTwitter" and ignore the rest of the options
- Download the config file and place it in your project directory
- Skip through the next steps as the project has done it all for you
- Once you reach the homepage again, select **Build** on the left and then select **Authentication** and click get started
- Setup a native Email/Password login WITHOUT passwordless login links
- Now create a **Realtime Database** and a **Storage Database** the same way you created your Authentication profile
Firebase should now be setup.

## Deployment - Build Project
To deploy this project run

```bash
  pod install
```
in the working file directory.

If you do not have pod installed, use this guide https://guides.cocoapods.org/using/getting-started.html to get started.
Once the pods are deployed you can just build and run the project in xcode.
