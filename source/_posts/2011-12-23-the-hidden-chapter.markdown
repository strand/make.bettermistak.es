---
layout: post
title: "The Hidden Chapter"
date: 2011-12-23 20:32
comments: true
categories: 
---
I didn't read five chapters this week, and that's partially because of the hidden chapter in all tech books. I believe the hidden chapter is a bug, but in documenting it I hope to make it in to a feature.

Tech publishing firms deals with different issues than other publishers. Tech books have small audiences which leads to higher prices per book as the economy of scale is the only thing that makes a paperback a possibly profitable prospect. (Though most books make very little. The secret of publishing is making small bets on unknowns and then creating and maintaining audiences for authors who find an audience with their first book.)

Tech authors aren't paid much relative to the compensation they can receive if they work as consultants. I don't have any info to compare their wage to authors in other sections of the bookstore, but anyone who has enough expertise to write a good tech book also has enough expertise to find better paying work elsewhere.

They also have to strike a difficult balance, being entertaining without being overly verbose, being informative without dulling the reader into a coma. I have been routinely surprised at how well written the prose is in tech books, and it comes from a high attention to detail on the authors part, as well as the early readers of the book, who are generally uncompensated.

To prepare a book for printing the publisher must work in rigid formats which preserve layouts and encourage migraines. There may be some editing staff that review the prose, but the publishing industry has scaled down heavily on copy-editors and other related quality assurance staff as the industry has digitized.

This is all to say, **mistakes are made in tech books**. They are to be expected.

However, a small mistake can have large ramifications for a coder just learning a new technology. I've been working through Rails 3 In Action written by Ryan Bigg and published by Manning Books. This morning at six, after a night of insomnia, I began working through the third chapter. My PDF was generated earlier this week, or it was delivered to me at the least, and I assumed that any known errata would already be incorporated. It turns out this is not the case.

Instead, I had an issue with using a version of Cucumber that had come out since the book was released and breaks the functionality of the code I was working through. The error got me confused, and I decided to take a rest. After a two hour nap and some veggie huevos rancheros, I tried my hand at it again. I figured out that my issue was related to using the wrong version of Cucumber. I tried a few things to fix the version issue on my current commit, but ended up having to revert to an earlier checkin with git. And that troubleshooting process took me a couple of hours where I would have actually worked through the material.

I believe that troubleshooting problems is an important skill to have. Mistakes in tech books encourage the reader to learn how to troubleshoot. But they also encourage frustration. I wish that there were a good, simple solution to ironing out errors from tech books, even those errors that are introduced by changing technology. From my understanding, Pragmatic Programmers has much better errata reporting system then Manning Books. Reducing the errors by using print-on-demand and continuous development helps a lot, but it will never be a silver bullet.

Those hours you take to troubleshoot something that should work, but doesn't, are the missing chapter in most tech books. Try to look at them as value-added content. And publishers, please try to keep the missing chapters in the second half of your books.