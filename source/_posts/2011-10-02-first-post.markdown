---
layout: post
title: "First Post"
date: 2011-10-02 18:16
comments: true
categories: 
---

Hello, internet. 

I'm just getting this blog up and running, and I hope that it will be a good place for me to learn more about the tech I want to use. This blog is running octopress on heroku, and I'm generally interested in improving my Ruby and Rails expertise, getting better at bash, understanding git, and a ton of other advanced-beginner-level open source web development related lines of inquiry. 

Below is a summary, notes to self, about how I got this thing up and running.

Today I successfully launched [make.bettermistak.es][1]. I followed the [setup guide][2] for a fresh octopress install, then used the [deploying to heroku guide][3] to get it on to a host. I then followed heroku's [custom domain guide][4] to setup my main domain.

TODO ensure that www.bettermistak.es, bettermistak.es, and *.bettermistak.es redirect to make. I think I can use [redirecting traffic to a specific domain][5] to do so.

Then, after composing this post, I ran **rake generate**, mentioned in the [blogging guide][6], to make the markdown into HTML. After that **git add .**, **git commit -m 'first post!'**, and **git push heroku master** to upload it to the web.

[1]:	http://make.bettermistak.es
[2]:	http://octopress.org/docs/setup/
[3]:	http://octopress.org/docs/deploying/heroku/
[4]:	http://devcenter.heroku.com/articles/custom-domains
[5]:	http://devcenter.heroku.com/articles/custom-domains#redirecting_traffic_to_a_specific_domain
[6]:	http://octopress.org/docs/blogging/