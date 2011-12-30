---
layout: post
title: "Hackathons - are they useful?"
excerpt:
  Just about every site I own has been moved to [AppHarbor](https://appharbor.com/). [SideBox](http://www.sidebox.com), [FHA Web Express](http:www.fhawebexpress.com), [CoovTech](http://www.coovtech.com), [Tekfolio](http://www.tekfolio.me) are some examples - It's a must have not just for scale and flexibility, but also for automated deployment.
---

Just about every site I own has been moved to [AppHarbor](https://appharbor.com/). [SideBox](http://www.sidebox.com), [FHA Web Express](http:www.fhawebexpress.com), [CoovTech](http://www.coovtech.com), [Tekfolio](http://www.tekfolio.me) are some examples - It's a must have not just for scale and flexibility, but also for automated deployment.

I'm a big believer in simplifying every aspect of the software development process from "file new project" to deployment. Nothing should take more than a click-or-two, or a few keystrokes. I believe my focus should always be on the code, not the tool. Microsoft has done a great job at perfecting my primary tool, Visual Studio, and now AppHarbor has made web deployment automatic for my daily workflow.

##Workflow

Most dev teams have a preferred workflow. Some might work very well and be efficient for the team but most workflows I've been involved in were slow, tedious, and especially painful if there was a mistake. I've always felt that deployment should be automatic every time you push code into a central repo. It should be as much of a natural thing and hitting F5 (build in Visual Studio)&hellip;

Done gasping? Think I'm crazy? Hear me out&hellip;  

For my personal sites, I'm perfectly happy working in my primary branch and deploying on commit. Only I can screw up my code, create bugs, bring my site down, so I'm ok with taking 100% responsibility for that. If I screw up then I can give myself a stern talking to. In a team environment, I'm not suggesting that programmers deploy after every commit on their own dev branch, but rather the master production branch, which should only receive commits from code that is production ready. This means that QA, UAT, or whatever workflow your team uses, has taken place and the code is shippable.  

I thought we made a huge improvement in deployment when [Beyond Compare](http://www.scootersoftware.com/) came out and we had that killer binary compare feature. I loved the ability of only moving code from my machine to production line-by-line. In retrospect I realize how crazy that sounds. It worked for me because the typical workflow I was using is flawed.  

The Subversion/Vault/SourceSafe type repositories helped push me down this crazy workflow path because merging with them has always been atrocious. One common workflow is that there is a central dev repository and a central production repository. The dev team checks in-and-out of the dev repository for several weeks until a scheduled deploy comes up. The dev them then needs to individually go into the dev repo and move their code over to the prod repo manually with a tool like Beyond Compare. Here is where I liked the line-by-line compare. The dev repo is incomplete; devs still might have the hood up on changes that are not production ready. If you move an entire file over that multiple programmers have touched, you are likely to move something into the production repo that is not production ready. This could break the build, or even worse, bring down the entire application on the next push.

By now you probably have a laundry list of things that are very wrong about what I just described. Truth is this workflow is very common. Now that I've seen the light and have moved away from traditional source control to [DVCS](http://en.wikipedia.org/wiki/Distributed_revision_control), things have become much easier. If you are stuck in a world where your source control sucks, then I encourage you to [move away from it](http://blog.coovtech.com/your-source-control-sucks). Gone are worries about massive merges. Exclusive checkouts; you don't need them. It's source control that is out of your way.

Remember that with DVCS, you commit early and often. You can commit until your fingers are sore. You can commit code that is buggy, that breaks the build, that would make your friends cry. It's the push to the dev (or central) repository that you want to be working. Many programmers don't understand what this means. They are used to checking out a file and not checking it back in again until it's working. This could be days, or even weeks. Some might do exclusive checkouts, forcing other programmers to go renegade on a file; it's terrible. This is not source control; rather it's a dumbed-down change management file logger thingy that is very inefficient in a team environment.

##Deployment for a team with AppHarbor

Here is the easiest way to automate deployments in a team environment while keeping buggy code that is not production ready:

- Create an AppHarbor account and setup either [Git](http://support.appharbor.com/kb/getting-started/deploying-your-first-application) or [Mercurial](http://support.appharbor.com/kb/getting-started/using-mercurial-on-appharbor) deployment
- Create a single repository with two branches (master and dev)
- The dev team commits changes on their local copy of the dev branch. Change commit, Change commit, over-and-over again until they are happy with their code. [Here](http://secretgeek.net/image/mercurial_workflow_image.png) is a good graphical representation of this workflow.
- Programmers push to the dev branch when their code is ready for testing or review or whatever the next step is in your workflow.
- If you are a small team and everyone can deploy to production, then you can have a dev get the teams changes on the dev branch, build-review-test them them locally, then merge to production.
- The merge to the production branch will trigger AppHarbor to build your latest version, run your unit tests if you have any, and will deploy your application to production.

Deployment that's integrated into a fluid natural workflow. No more having devs move changes from one repo to another that are days, weeks, or months old. No more comparing files. Just code, commit, push.