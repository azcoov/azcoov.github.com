---
layout: post
title: "Your Source Control Sucks"
excerpt:
  Did anyone make any changes to [fill in the blank] code? This question makes my blood boil yet it's a question that I've asked probably 100 times over for the last five years. If you are asking this question too then guess what, you don't have source control and what you are using sucks.
---

>Did anyone make any changes to [fill in the blank] code?

This question makes my blood boil yet it's a question that I've asked probably 100 times over for the last five years. If you are asking this question too then guess what, you don't have source control and what you are using sucks.

Source control is supposed to help you track changes. If you are asking the question above it means that whatever source control system you are using sucks at tracking changes, or you haven't figured out how it tracks changes. So all source control is really helping you with is backing up your files. That's not the point of source control... Why not just use dropbox and stop wasting time checking files in and out?

##What's the solution?

If you haven't already guessed, this is a post about DVCS (distributed version control systems). About a year and a half ago I started playing around with [Git](http://git-scm.com/), a popular DVCS, because I wanted to start getting involved in open-source projects I was finding on [GitHub](http://www.github.com). I thought DVCS was cool and the idea of forking and cloning was cool but I did not fully understand or appreciate the value of DVCS until we started using [Mercurial](http://mercurial.selenic.com/) for [SideBox](http://www.sidebox.com) in a team environment.

I took the Joel Spolsky [Hg init](http://hginit.com/) tutorial and I immediately began to see the light. What resonated with me the most was two things. 1) Branching and Merging work and you no longer need to run in fear from it and 2) You are encouraged to branch or fork or clone to try out new things and throw them away if you don't need them. As if your giant Visual Studio project was nothing more than a plain old scratch pad.

I was the same guy Joel is talking about in his intro. Afraid to make experimental changes. Kept files checked out for weeks, if not longer. Hated. No no, dreaded having to merge and would often find reason to postpone it. But not any more. Joel says it just works and you should take his word for it because it does.

##Getting to the point

When someone makes a change in a DVCS system and they have pushed it out and infected everyone else with it, you don't have scream over your cubicle wall asking "who just changed the blablity blah blah?" because you have the change set. You get to see who changed what, when, and why. You don't have to traverse a massive folder structure in your POS repository looking for the most recent dates on files because you have the change set and you know who changed what, when, and why.

And guess what? When you figure out who infected you with their shitty code, you are a command away from ripping their change set out from your copy. No more spending hours rolling back individual files, or trying to find the right labels or blah blah. It works the way version control should work; by tracking change sets.

I should point out that it is not fool proof... If you deploy changes to production without pushing your commits to the team repository then you will probably still scream over the cubicle wall. Don't do that unless you are a team of two, wink wink.

So stop asking that silly question and start busting heads until someone with the power to pull the trigger on moving you to DVCS does just that.

P.S. I prefer Git over Mercurial. Not for some religious reason. I simply happen to be a big fan of [GitBox](http://www.gitboxapp.com/). Simple to use and it gets me out of the terminal.