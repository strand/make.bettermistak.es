---
layout: post
title: "How Do I Keep Secrets While Sharing Code?"
date: 2011-11-20 15:46
comments: true
categories: 
---
This week I've been working on a pretty simple Sinatra-based website which uses the [twitter gem][1]. I'm almost ready to post what I've got so far on github and heroku and see if anyone likes what I've made so far. But before I commit my code publicly, I want to ensure that my secrets are properly obfuscated. Below is a codeblock used to load secrets and keys into the application:

{% gist 1381160 authenticate.rb %}

Correspondingly, below is the YAML which has the secrets, with my secrets stripped out:

{% gist 1381160 config.yml %}

This is a fine way to obfuscate my secrets, but only if I never include the secret in my repository, which I can do easily enough with .gitignore. But, I only want to exclude this from my viewable source, not from my deployed application, otherwise my app won't run. [Github's help][2] indicates that "Local per-repo rules can be added to the <code>.git/info/exclude</code> file in your repo," but doesn't indicate how this info needs to be formatted. The guides to .gitignore I have found have all directed me to a broken man page for more information, I think I need the help of a professional.

So the question is: **how do I make committing this YAML file conditional?** So I never accidentally upload it to github, but it always shows up on Heroku?

[1]:	http://twitter.rubyforge.org/
[2]:	http://help.github.com/ignore-files/