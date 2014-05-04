---
layout: post
title: "Fred Brooks: Werewolf Hunter"
date: 2014-05-03 18:50
comments: true
categories:
---
Programming culture is a pop culture. The inevitable Hollywoodization of "No Silver Bullet" is apparent enough to me that I can see the movie trailer in my mind.

Our protagonist is hunkered in a dirty underground bunker, reviewing his weapons carefully. As a voiceover he curmudgeonly complains "Of all the monsters who fill the nightmares of our folklore—"

_a heavy bass thud as we flash cut to him wandering a graveyard at midnight_

"—none terrify more than werewolves—"

_out of the corner of his eye he sees something and turns_

"—because they transform unexpectedly from the familiar—"

_he is attacked by a fast-moving wolfman, and fires a crossbow at it_

"—into horrors."

_Cut back to the bunker as he opens a box of shells…_ "For these, we seek bullets of silver that can magically lay them to rest. I have bad news, there are no silver bullets." Then a title card comes up declaring "Fred Brooks: Werewolf Hunter. Coming Summer 2016."

--------------------------------------------------------------------------------

I reread ["No Silver Bullet"](http://faculty.salisbury.edu/~xswang/Research/Papers/SERelated/no-silver-bullet.pdf) today, and while I agree with its thesis I don't know if its conclusions hold up. The thesis of "NSB" is that software will never have order of magnitude improvements occur within the timeframes that these sorts of improvements happen with hardware because the essence of the work of software development is not conducive to these sorts of improvements.

Brooks writes, "I believe the hard part of building software to be the **specification, design, and testing** of this conceptual construct [that is the essence of software], not the labor of representing it and testing the fidelity of the representation. We still make syntax errors, to be sure; but they are fuzz compared to the conceptual errors in most systems." [emphasis mine]

No doubt, the specification, design, and testing of the conceptual framework of the software is where most of the labor lies. Most of the problems of software development lie in figuring out what you actually need the software to do, often from a loose set of requirements from folks whose expertise lies outside the domain of software.

To create incremental improvements in how software is constructed Brooks makes four suggestions:

- Buy software instead of building it.
- Use rapid prototyping to refine requirements.
- Grow your software instead of building it using incremental development.
- Foster great designers by rewarding them with status.

This last point is the one I quibble with, and feel it could use its own essay in defense, but Brooks complains that "space does not permit a lengthy discussion" on growing great designers, though the difference between average and great is like that of Salieri and Mozart. By way of example he says that Unix is great while MS-DOS is only average, which sounds about right. He claims that, "The differences between the great and the average approach an order of magnitude."

He then goes on to outline:

> How to grow great designers? Space does not permit a lengthy discussion, but some steps are obvious:
>
> - Systematically identify top designers as early as possible. The best are often not the most experienced.
> - Assign a career mentor to be responsible for the development of the prospect, and keep a careful career file.
> - Devise and maintain a career development plan for each prospect, including carefully selected apprenticeships with top designers, episodes of advanced formal education, and short courses, all interspersed with solo design and technical leadership assignments.
> - Provide opportunities for growing designers to interact with and stimulate each other.

To me this outline is akin to recognizing that there are no silver bullets, and thus resigning to giving the werewolves the corner office.

I do believe there are significant improvements that can be made which will make software's design improve from average to great, but I don't believe that improvement needs to happen primarily at the level of the individual, but instead at the level of the team. If this sort of cultural shift can be fostered then the quality of software the team produces will be great, and so will the quality of life for the developers who are working on it.

How to grow great teams? Space does not permit a lengthy discussion, but some steps are obvious:

- Systematically identify developers who will collaborate well with others. The best are often not the most experienced, and the best collaborations are often across experience levels.
- Mentorship is the responsibility of everyone on the team. Formal mentors may be assigned and career files kept, but instead of trying to formalize the entire process, instead grow a culture of respect and make it a priority that developers recognize that their work requires both that the continually learn and that they support others in their learning.
- Devise and maintain a career development plan for every person in your organization. Build apprenticeship into the DNA of your team. Episodes of informal education, and opportunities for all to teach each other, all interspersed with collaborative design and technical leadership assignments.
