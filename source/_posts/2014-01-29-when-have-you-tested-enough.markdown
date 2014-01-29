---
layout: post
title: "When Have You Tested Enough?"
date: 2014-01-29 10:07
comments: true
categories:
---
Not sure I really answered your original question tho. In TDD the idea of 'enough' tests may be missing the point. I don't claim to TDD all the time, or to do it perfectly when I do, but one of the things that has been an apparent focus of TDD to me is the focus on tests driving design.

More to the point, the purpose of TDD as I understand it is to express expectations as test code, which unlike documentation needs to stay in sync with the changing codebase. By driving out our object from tests we create simpler and more focused methods.

In example, last year I was working on calculator code for a client which had some wonky business logic. I drove out the code using tests, and came up with what I thought was an elegant design (a bunch of single-line methods) in a pretty quick cycle. However, I had misunderstood the requirements when I wrote the tests, and the client wasn't happy.

I quickly found out how the requirements I had written down in tests differed from reality, changed the tests, then made each failing example go green. If I had designed this without tests behind it, I would have likely written some dense conditional logic, and when it failed to meet expectations it would have been faster to throw it away and try again than to refactor it. The design that tests encourage was better for dealing with change.

I have when writing tests for unfamiliar languages written tests for things like setting variables. It was the simplest thing that I could think to test and writing that test gave me the confidence and familiarity to be able to soldier bravely onward. However, I wouldn't keep a test of that sort in the codebase. There is nothing too small to write a test for at least once, so that you can prove to yourself that your expectations match the reality of the execution of code. There are, however, tests too trivial to commit to version control. The tests that I want in my test suite are ones which prove that the business logic of my application works, not that the language or libraries work.

Or more to the point, I only test the code I want to work. I want code which I trust the least to work the most, and I trust new code less than old code, changed code less than old code, my code less than my team's code, and my team's code less than library or framework code.