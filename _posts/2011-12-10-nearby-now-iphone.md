---
layout: post
title: "Making Nearby Now for iPhone"
excerpt:
  I love a challenge and stepping out of .NET land to tackle another programming language for a couple weeks was a blast! So what about Objective-C & Xcode from a .NET programmers perspective?
---
I love a challenge and stepping out of .NET land to tackle another programming language for a couple weeks was a blast!

So what about Objective-C & Xcode from a .NET programmers perspective?

There is a learning curve. That's expected when moving to any new programming language. When I started learning Ruby on Rails, or PHP, or Java, or even moving from .NET Web Forms to MVC, same thing, a learning curve.

This was actually my third try at Objective-C. My first two attempts were a couple years ago. I really didn't have a plan for an app and I think that contributed to my dis-intrest in really learning the language and environment.

When it came time to build an [iPhone app for SideBox](http://blog.coovtech.com/sidebox-for-iphone), I wanted to do it with [MonoTouch](http://xamarin.com/monotouch) because I love C# and MonoTouch allowed me to build a ton of re-usable code that I could add to MonoDroid and WindowsPhone 7 when we got to those platforms.

I almost built Nearby Now in MonoTouch. The only reason I didn't was because I had this personal vendetta against Objective-C and felt that I needed to concour it. Barry, my business partner, suported this decision so I went forward. I still think MonoTouch is awesome! If you know .NET or if your organization has a lot of .NET devs, or if you want to learn .NET, MonoTouch is a great choice. My words really don't do MonoTouch and the [Xamarin team](http://xamarin.com/) justice. They are one of the smartest dev teams out there. You'll have a learning curve, like always, but it's small. Verry verry small. Especially if you've built anything (web or desktop) in C#. You can sprinkle in some MonoTouch.Dialog and you'll be blown away even further at how easy MonoTouch is.

##Decisions... Decisions...

So what will I use going forward? Both. It all depends on what we are building, who is going to be coding on it, and who will support it. If I build something with a .NET team, I won't hesitate to use MonoTouch. If it's a personal project, it will depend on what my needs are and how heavy I'll rely on SQL Server, Web Services, re-usable code, etc.

Ok, back to Objective-C. I really enjoyed learning the language, especially the new ARC way to develop. It felt more natural to rock ARC, coming from .NET.

My favorite thing with iOS dev is the new Storyboard feature for laying out views and navigation. Xcode made it very simple to transition from one view to another and as a visual person, I really appreciate being able to have that high-level flow view.

I really like the delegate pattern in Objective-C. It's so similar to how we build classes & controls with event delegates in .NET that I felt right at home. 

The app is [in the App Store](http://itunes.apple.com/us/app/nearby-now/id484145186?ls=1&mt=8) if you want to check it out. Unless you are a service professional you won't find much use for it, but hey, it's free to check it out!

If you're interested in more of the technical details, including some of the open source projects we used in the app, you can find that information [on my tekfolio](http://www.tekfolio.me/billy/portfolio/nearby%20now%20for%20iphone).