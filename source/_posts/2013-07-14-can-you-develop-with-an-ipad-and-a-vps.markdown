---
layout: post
title: "Can You Develop With an iPad and a VPS?"
date: 2013-07-14 20:06
comments: true
categories:
---
I've been playing around with connecting to a remote server using my iPad in the last few days. I'm curious if I can develop without a laptop. It's an interesting constraint to work within. Other accounts of using an iPad and a remote server to develop, like [I swapped my laptop for an iPad+Linode](yieldthought.com/post/12239282034/swapped-my-macbook-for-an-ipad), sold me on the possibility of developing on the iPad ages ago. This weekend I thought I'd try it out.

My friend [@zspencer](http://twitter.com/zspencer) recommended Digital Ocean* as a quick to setup VPS, and Prompt and iSSH as iPad apps that give me an ssh terminal. Yesterday I set up a Droplet, Digital Ocean's name for a remote server. Basically, I gave them a credit card number, clicked a button, and a minute later I had a remote Ubuntu box reserved for me, an IP address, and a root password.

Since then I've played around with working on that machine just through the iPad. I cheated once, last night when I wanted to add my remote box's SSH key to github and I couldn't figure out how to copy the key from the command line into my iPad's clipboard.

My web development toolkit on a computer requires me to use a shell, a browser, and a text editor. From the iPad I've got the shell. I can use vi for text editing, but it's not something I've got practice with, yet. The trickiest thing is getting a browser going while I'm in the development environ. One route would be to treat the remote server as a staging server. I could write code in vi, administer in the shell, then load the site up in a browser on the iPad. Unfortunately, I don't want mid-commit work to be staged, I just want to be able to view it.

What I want is to be able to go from the Ubuntu terminal to a GUI environ and look at the site in a browser running on the server. iSSH has a VPN option, but I couldn't figure out how to get it working this afternoon. In fact I remembered something about X, the linux GUI, and thought I needed to start up xterm. Looking at it now I realize I need to start **X** not **xterm** which is a terminal program.

The experience reminds me a bit of the first time I worked with Linux. I ended up installing Red Hat on a Compaq box my family had stopped using. I got the terminal running, but I couldn't ever figure out how to get a GUI running, despite skimming over a thousand page how to use Linux tome I'd ordered from Powell's. I don't think I touched Linux again for another six or eight years.

Anyhow, getting a GUI running in iSSH is clearly my next step, but I also need to figure out if this is the time to level up my vim-fu or figure out how to use Sublime Text in a remote version of Ubuntu. Neither is a particularly terrible option.

One other thing I need to figure out sooner rather than later is how to create a non-root user with the correct permissions to create files, install programs, and make things go. I've done a little remote server administration, but most of it has been following recipes written by other developers, and I can't remember what needs a chmod.

Have you used a remote system to develop? How did you level up? What resources were useful for you? (And how do I get my GUI running? Work with an account other than root?)

---------------

<small>* Digital Ocean is just one of many VPS providers. Others include Linode, Amazon VPS, and Slicehost. I don't have any strong opinions about any of these providers, they all give you access to a server you can administer remotely for about the same price as a cup or two of fancy coffee a month.</small>
