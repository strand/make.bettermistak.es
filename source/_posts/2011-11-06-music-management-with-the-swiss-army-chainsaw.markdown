---
layout: post
title: "Music Management With the Swiss Army Chainsaw"
date: 2011-11-06 15:04
comments: true
categories: bash
---
Last night I was cleaning out my music collection… I know, not the most interesting Saturday night, but over the last decade my collection has gotten a little hairy.

It's also grown to the size that pruning it by hand with Finder is nearly impossible.

Initially, I just wanted to find some files which had been accidentally duplicated. There were folders with a bunch of songs titled **file.mp3** and **file 1.mp3**. My first stab at this had me listing files and then filtering them by piping them to grep, and yielded commands that looked like this **ls -Rd | grep -i ' 1\.mp3'**. 

After some filtering like that for a while I realized that find might be a better tool for the job.

I looked at find and ran several test  to figure out what I wanted. I came up with **find /Volumes/Strand/iTunes\ Music/Music\ Archive/ -type f -iname '* 1.MP3' -exec rm -f {} \;** which finds all the files in my Music Archive which have the case-insensitive suffix of '1.mp3', and when it finds them, it removes them with force, that is, it deletes the files without checking with me first.

After feeling the immense power of find I couldn't stop. I had to delete empty directories with **find /Volumes/Strand/iTunes\ Music/Music\ Archive/ -type d -empty -exec rm -f {} \;**

Then, I got curious, which was my first mistake. Could I come up with something that would find all of the directories with folders with just one file in them? After all, my archive was cluttered up with plenty of one-hit wonders. To figure out how many files a directory has you can run **ls -1 | wc -l**. Which is to say, list all of the files in the current directory, each on a line, then pipe the results into the word count tool which is set to count the number of lines.

I experimented with using these commands in the -exec argument on find, but I ran into errors indicating that I needed to have a better understanding of bash fu to solve this problem.

So I went out for pho. When I got back to my apartment this problem was still tickling my brain, so I went to the bash IRC and asked for some advice.

With their help, I eventually ran **time find /Volumes/Strand/iTunes\ Music/Music\ Archive/ -type d -exec bash -c 'cd "$1"; f=(*); (( ${#f[*]} == 1 )) && [[ -f $f ]] && echo "$1" >> ~/Code/singletons.txt' _ {} \; && say "I'm done"** which listed out all of the singletons in a text file for me. Though I must admit this incantation is voodoo to me. This is likely a problem which a shell script, rather than a one-liner, would be more apt to solve.

It was plenty fun to play around in the shell, I hope that next time I'm better able to puzzle out quickly which commands are useful.

Lessons learned: bash is a great music management tool, if you don't mind pruning your collection with the Swiss Army chainsaw, the bash IRC is friendly and active, and appending "; say 'Imdone'" to commands that run more than ten seconds will save your sanity.