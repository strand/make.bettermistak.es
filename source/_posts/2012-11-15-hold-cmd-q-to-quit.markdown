---
layout: post
title: "Hold ⌘Q to Quit"
date: 2012-11-15 09:25
comments: true
categories: 
---

One of Chrome's features that I really love is the "Warn Before Quitting" option under the Chrome menu, which prevents the program from quitting with a message saying "Hold ⌘Q to quit." displaying for a second or two before the browser closes.

Unfortunately, that feature only exists in chrome, and I have fat fingers everywhere. So last night I asked on Twitter, "Lazyweb: Any way to make Google Chrome's "Hold ⌘Q to quit" ([Google blog post explaining the feature](http://googlemac.blogspot.com/2011/06/q-i-didnt-mean-to-do-that.html)) the default across OSX?"

My friend [@perisaccadic](https://twitter.com/perisaccadic) responded that KeyRemap4MacBook has that feature. I looked at the documentation last night, and KeyRemap4MacBook has a lot of key remapping features. Setting it to prevent quitting on accidental keypresses isn't hard, but it isn't obvious either. Here's how you do it.

1. Install [KeyRemap4MacBook](http://pqrs.org/macosx/keyremap4macbook/index.html.en) and restart your computer.
2. Go to "System Preferences…" under the Apple menu, and select KeyRemap4MacBook.
3. Under "Custom Shortcuts" select "Hold Command+Q to Quit Application." There are a lot of menus under the "Change Key" tab, and I recommend using search box at top and just searching for "quit."
4. Select the Key Repeat tab and adjust the "[Holding Key to Key] Holding Threshold", which has a default of 200ms. I set this to 2000ms, as I want to have half a breath before I close my programs, your mileage may vary. This option is the third from the bottom.

Then system-wide you'll have to hold down ⌘Q, rather than bumping it by accident and losing whatever you were working on.