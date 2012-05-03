---
layout: post
title: "How to Create a Local Sandbox Facebook App"
date: 2012-05-03 12:41
comments: true
categories: walkthrough
---
**Note:** this walkthrough only handles UNIX-y environments, like Linux and MacOS.

Facebook makes it easy to get started developing an app that integrates with their service, but I ran into a snag that confused me when I was trying to test my app locally. Here's what I did to resolve the error below, which is thrown when you first try to log in on the Facebook Ruby-based app on localhost:

> {
>    "error": {
>    "message": "Invalid redirect_uri: Given URL is not allowed by the Application configuration.",
>    "type": "OAuthException",
>    "code": 191
>  }
> }

To get started login to [https://developers.facebook.com/](https://developers.facebook.com/) with your Facebook account and click **Get Started**. Under Create a Facebook App, click on Developer App and Create New App, Name it ("Brony Finder"), Give it a Namespace ("og_brony") and click the ticky-box for Heroku web hosting. I grumbled at having to provide a mobile telephone or credit card, and then moved on.

Select your environment and the email address you would like this Heroku app to be associated with, in my case, Ruby and strand@bettermistak.es. Your new app lives at _https://thing-stuff-1234.herokuapp.com/_. Mine was _https://electric-robot-2715.herokuapp.com/_.

Login to Heroku and head to "[My Apps](https://api.heroku.com/myapps)" Click on general info and copy the git address under Git Repo. Go to the command line and in the directory you want the code to live in enter the following

> git clone git@heroku.com:electric-robot-2715.git
> cd electric-robot-2715/
> bundle install
> gem install foreman
> foreman start

Navigate to localhost:5000 in your browser and click "Log In." Oh no! you get OAuthException 191! This had me stuck for a few hours, and all I found were a few confusing Stack Overflow posts about it.

Facebook verifies that all requests for your app are coming from the right domain–they don't allow requests from localhost or 127.0.0.1–and this info can be updated in your [apps settings](https://developers.facebook.com/apps) under Hosting URL. {% pullquote %}{" Add "local.herokuapp.com" to your Hosting URLs and save this setting. Then edit your `/etc/hosts` file so that local content is under the domain local.herokuapp.com. "}{% endpullquote %} This file is hidden, so from the command line enter `sudo vi /etc/hosts`. (Substitute your favorite editor for vi.) We need to use sudo, because this file is locked. Add the line "127.0.0.1  local.herokuapp.com" below "127.0.0.1  localhost" and save and quit your text editor.

Hit control-c and run `foreman start` again. Now test your app at http://local.herokuapp.com:5000/.

Happy Hacking!