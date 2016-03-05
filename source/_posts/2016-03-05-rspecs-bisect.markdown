---
layout: post
title: "Finding intermittently failing specs with RSpec's bisect"
date: 2016-03-05 09:02
comments: true
categories:
---

*High level takeaways:* _As of RSpec 3.4 we have a `--bisect` flag which is used to find order-dependent spec failures. Using bash, we can run an inconsistent spec until it fails, and using its seed number use an RSpec command of the form `rspec spec/some_spec.rb --seed 12345 --bisect` find the minimum number of specs to run in order to recreate the failure. This drastically reduces the amount of code which needs to be reviewed to find the cause of spec failure, which is likely a side effect in the passing spec. This passing spec that causes later failures can be isolated using the documentation formatter._

I work on a large app with thousands of specs of varying quality.

Unfortunately, running our spec suite locally is impractical, and running all the specs in continuous integration can take more than a half an hour. Our specs fail intermittently, and spec failures delay builds from passing while reducing developer trust in the specs.

I recently came across a file which had an intermittently failing spec in my local environment. At the time I didn't have the attention or the tooling to address the issue. I noted the seed number, which RSpec uses to run the same specs in the same order, and moved on.

A while later a friend [tweeted about git bisect](https://twitter.com/seanlinsley/status/704144587703451649). I had a little free time at the end of my work week, so I decided to try out this technique to isolate the minimum reproduction to cause failing specs.

I ran the spec with the seed number I'd recorded a few weeks earlier to confirm the test was still failing in this order, and got the failure I expected. I then tried running the spec with the bisect command, but RSpec failed because it didn't recognize the `--bisect` command flag. Bisect was introduced in RSpec 3.4, and I was using an older version in this project.

I updated RSpec and ran the seeded spec again, and this time it passed. I'm not sure why, but I had a hunch that the spec failure still existed, and perhaps RSpec had changed its seeding algorithm between versions. So I decided to run the spec until it failed. *If you don't know the seed number to reproduce a failing spec, you can run the script below to find it.* I ran this script and went to lunch.

``` bash
until [ $? == 1 ] # $? is last exit code, and 1 is the failure exit code.
do
  bundle exec rspec spec/some_spec.rb
done

# (I use zsh in my terminal, and some of this syntax doesn't work in that shell.
# To fix this I dropped into a bash shell with `bash`, which I closed when I
# finished up with `exit`.)

# There are some obvious improvements I would make if this weren't throwaway
# code. First, I would put it in a script file, maybe titled
# `run-until-failure`. Second, it could use a command flag which indicates how
# many times a script should be run until it's considered a consistently
# passing spec. Third, I'd extract the spec command itself, and pass it into
# the script. Since inconsistent spec are such a drag on fast development, I
# am considering making these improvements and running our entire spec suite
# through this to find our flakiest specs.
```

When I came back from lunch I had a new seed number, which then used to bisect my spec with a command resembling `bundle exec rspec spec/some_spec.rb --seed 12345 --bisect`. In a few minutes RSpec returned command that looked like `rspec './spec/some_spec.rb[1:16:1:2:1,1:31:2:1,1:31:2:2,1:32:4:1,1:35:2]' --seed 12345`. I ran this command, but added the documentation formatter by appending `--format documentation` to it. This printed out the expectation message from describe and it blocks associated with the handful of specs this command runs.

In this case, I got one passing spec, and four failing specs. The passing spec was executed before the failures, so I suspected it was causing a side effect in its sibling specs. I used the strings printed out from the documentation to search the spec file for line numbers, and then I ran the specs in pairs, matching the passing spec with each of the failing specs. I usually had to run these a few times to get the passing spec to run before the failing spec, and recorded the seed number to recreate this failure in each case. Then I looked at the code and found there was one line I could comment out which would cause my failing specs to pass. Of course, the previously passing spec now failed, but now I could isolate or remove this side effect, and increase our spec suite's stability.
