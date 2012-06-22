---
layout: post
title: "Design is HARD when you're not a designer"
excerpt:
  I recently re-built [Nearby Now](http://www.nearbynow.co/app) from the ground up. I made the decision to not only re-write a lot of the code base, but to also add new features and an entirley new look-and-feel to the application. It's my first attempt at `designing` an iPhone app and not just building one. My end-goal was simple; create a new version with more features but make it easier to use for our customers.
--- 

I recently re-built [Nearby Now](http://www.nearbynow.co/app) from the ground up. I made the decision to not only re-write a lot of the code base, but to also add new features and an entirley new look-and-feel to the application. It's my first attempt at `designing` an iPhone app and not just `building` one. My end-goal was simple; create a new version with more features but make it easier to use for our customers.

Now, don't let me fool you. This is not just about building a beautiful app. This is about resources. The easier to use and more intuitive the application is, the less support calls we take. For a two-man part-time team, time is everything!

##"That was easy" - NOT!
As an Enterprise .NET Engineer for the last 8 years, giving applications thoughtful asthetics was never something I really focused on. I know that is a terrible thing to say but the truth is, in the corporate world that I worked in, design always came third; behind is it done yet? and why wasn't it done last week? We rushed functionality and focused on design later. In other words, design went to the backlog. *The bottom of the backlog*.

Some of the design challenges are actually simple to solve. Build an easier login screen. Make a button more obvious and use icons or colors. Consolidate fonts and colors into a simple style guide and stick to that throughout the app. Add intuitive alerts and warnings when things don't go as planned instead of "Error, try again".

Not everything is that easy... I ran into some snags over things I've never really considered before. For example, there are two areas in the application that are similar in look-and-feel and functionality. Their data model is also similar with the exception of a couple of properties. One view is of a `job`, which is a customer's house or place of business if you are a plumber/exterminator/hvac tech, and the other view is of a technician's location. Both views have geolocation data, render a map, and have similar actions represented by the same icons.

I wanted to make sure there was a clear distinction between the two views. I don't want the user to be confused by where they are in the app, however I wanted to keep some similarities so that the user is comfortable with the experience and is able to perform actions with ease. Remember, training must be minimal. I've already moved their cheese with this re-design and addition of new features.

##Job View vs. Technician View - The Problem
The first thing you'll notice is that both views have three cells in a table. The uper-cell has some metadata, the middle cell has a map, and the lower cell has a menu represented by icons. I really like the look of these views. I took some inspiration from the [Twitter app](https://twitter.com/download/iphone) when laying out this style. There was an obvious problem that I was getting frustrated with though. Aside from the metadata, these two views look the same. I'm lost:
![before](https://s3.amazonaws.com/assets.coovtech.com/blog/nbn-before.png)  

##Job View vs. Technician View - The Solution
To fix the views, I wanted to add something that made it obvious that they were either looking at the Job View or the Technician View. Something more obvious than a title. I decided to add more metadata to the Job View (via photos they can take while on the job), and update the Technician View with a larger hybrid map. The reason I chose a large hybrid map is because the Technician View context is all about where that Technician is currently located. I designed this view so that a team of service professionals could easily see where their team was on a map, and when drilling down into an actual technician, see where that tech is located down to the street level. The next logical action when looking at a Technician is to call or SMS that tech, or get driving directions to their current location. The Job View map is more for visual confirmation that we've locked-on to your current location. You know where you are and you'll probably not be focusing on the map much. You'll be focusing on taking before and after pictures of the work you are doing, taking notes about the problem, and sending the customer a request to review you when you leave.
![before](https://s3.amazonaws.com/assets.coovtech.com/blog/nbn-after.png)  

I like the way this turned out. I think the look-and-feel will be familiar to the user but not too complicated. It should now have a clear distinction between the two views and hopefully make life easier. But at the end of the day, I'm not a designer, so who knows what will happen O_o.

##What I've learned
My biggest takeaway after leaving the corporate world is that priorities are a little different when you call the shots and wear all the hats. We have customers paying us real money for a product that our two-man team built. What a great feeling! This makes me want to focus on building features in our apps that are beautiful and easy to use but also useful. We talk to customers all the time who are on XYZ software built in the mid-90's and they hate it because `[enter some convoluted thing the software does here]`. Rather than ship as much functionality as fast as possible (if you think that's just "Agile Software Development", well, you'd be wrong), **I'm focusing on shipping the higest value as efficiently possible**. 
