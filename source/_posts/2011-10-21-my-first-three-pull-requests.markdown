---
layout: post
title: "My First Three Pull Requests"
date: 2011-10-21 11:37
comments: true
categories: 
---
In the last couple of weeks I've made a few pull requests on Octopress, which is the blogging platform this blog uses. The primary reason I was making the pull requests, oddly enough, was to get a sense of how the process of making changes and improvements on github works. One of the things I picked up from it was a better understanding of the use and nuance of git.

The three pull requests I made were:

* [Pullquote left][1]
* [Blockquote improvement][2]
* [Alternate read more link text][3]

The first request got approved, the second is languishing with no current action, and the third got quickly requested, with an excellent conversation.

<!--more-->

My improvements to Octopress focused on making minor changes to presentational issues. I got to play around with other people's Ruby code, learn how Jekyll's Liquid tagging system works, learn a little bit about SASS and regular expressions, and discuss the particulars of code with project leads.

The pullquote left improvement made the existing pullquote plugin accept an argument of "left" which formats that pullquote on the left side instead of the default of right. I wrote a rudimentary regular expression to match it and modified the existing "has-pullquote" class to create the "pullquote-right" and "pullquote-left" classes which are used by the SASS to format the text properly. {% pullquote %} {"A possible future improvement is implementing automated alternating pullquote functionality"} {% endpullquote %} so that posts with multiple pullquotes switch off between left and right.

My next improvement was a change in the implementation of blockquotes. Octopress has three ways in which the Markdown will translate into blockquotes, and I believe there is a semantic difference in how blockquotes are used which should lead to two related but varied styles of presentation. Blockquotes can be created using a blockquote tag, using Markdown's '>' which emulates email threading, or by using the liquid tag blockquote which invokes [Octopress' blockquote plugin][4].

Unfortunately this request is hard to read, because I accidentally made the changes on the same branch and so my pull request accidentally merged changes from the earlier pullquote request. I believe this is part of the reason it's received little attention. Additionally, {% pullquote left %} {"I did a poor job of initially explaining why the difference between how the blockquote plugin is invoked"} {% endpullquote %}, which made arguing that the different versions should be styled differently difficult.

**Here's the basic problem:** when someone calls the blockquote plugin using the liquid tag, it adds styling which is entirely appropriate for quoting someone. Specifically, it makes the text larger, by a factor of twenty percent. This formatting applies the same when you're using Markdown's right caret to make blockquotes, but this is a different kind of blockquote. Specifically, this blockquote is likely to be nested, and the liquid tag shouldn't ever be nested. When blockquote styling is nested it scales up. A first level blockquote is 120% of normal text size, second level is 144%, third level is 173%, and fourth level is 207%.

Anyhow, it's an edge case that people will be invoking nested blockquotes, but it's certainly a fixable edge case.

The last pull request I made started as an attempt to start building my own plugin. And after a few hours of working on it I discovered that what I was working on duplicated existing functionality. I wanted to implement a "read more" plugin, which would either create a link to the permalink of an article on the blog's index, or alternately, use javascript to hide content past the read more link until the reader clicked on it.

Two decent implementations of this idea are [WordPress' read more][5] and the Slog's continue reading. WordPress' implementation was the one I was most familiar with, and I wanted to do something similar, except I thought that using the liquid tag instead of an html comment might leave devs with future flexibility. After I had spent a couple of hours working to figure out the details of this sort of implementation, I realized that this functionality already existed in [Octopress' octopress_filters][7] plugin, though it used a standard html comment. So I switched gears and thought about how I could improve the existing filter.

As written, this filter lacked a feature which I knew existed in the WordPress version it was modeled after. You couldn't change the read more text inline, and so what this says to entice the reader to click through remains the same site-wide. {% pullquote %} {"I learned from my previous experience and created a separate branch"} {% endpullquote %} so that my pull request would only have changes made related to this improvement.

I altered the existing regular expressions in post\_filters so that they would be slightly more liberal in what they accepted as a read more comment, so that it would include ones which had the alternate text in the tag itself. Then I implemented some conditional logic within the article template using Liquid tagging, so that when the more tag contained alternate link text, that text would be pulled out by the post\_filters plugin, then displayed on posts in the blog index. I made a request and within an hour [@imathis][6], Octopress' creator and maintainer had rejected the request. 

I could be disappointed that my request was squarely rejected, but I learned a lot in the process of trying to change the code, and the post-mortem discussion is really valuable in that it lets me see what type of change is wanted on this project.

I don't know if I'm going to continue trying to improve Octopress, though it might be nice to create a decent footnote plugin for it.

[1]:	https://github.com/imathis/octopress/pull/215
[2]:	https://github.com/imathis/octopress/pull/220
[3]:	https://github.com/imathis/octopress/pull/233
[4]:	http://octopress.org/docs/plugins/blockquote/
[5]:	http://codex.wordpress.org/Customizing_the_Read_More
[6]:	https://github.com/imathis/
[7]:	https://github.com/imathis/octopress/blob/master/plugins/octopress_filters.rb