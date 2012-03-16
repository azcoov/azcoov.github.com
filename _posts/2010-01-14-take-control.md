---
layout: post
title: "Take Control of Your URL’s"
excerpt:
  I did a side project once and a customer asked me why all their pages had “.aspx” at the end of them. I explained what it was and offered to “fix” that issue for a small price. After all, I was “solving” a problem. Since that conversation, I’ve always been bitter because I didn’t have a good answer to that question and I hate saying “just because”, as if some magical voodoo was forcing my into compliance with how my URL’s looked. I dislike URL “Rewriting”.
---

I did a side project once and a customer asked me why all their pages had “.aspx” at the end of them. I explained what it was and offered to “fix” that issue for a small price. After all, I was “solving” a problem. Since that conversation, I’ve always been bitter because I didn’t have a good answer to that question and I hate saying “just because”, as if some magical voodoo was forcing my into compliance with how my URL’s looked. I dislike URL “Rewriting”.

One of my favorite features of ASP.NET MVC is the ease in which it allows me to control my URL’s. Routing!

With Routing, its total control simplified. When writing my new blog engine I was trying to decide the shape of my URL’s for blog entries. Do I want mysite.com/Entries?id=3, or mysite.com/Entries/3, or how about mysite.com/Entries/Year/Month/Day/EntryTitle ?

The built in routing engine makes this super simple. Here are the three different routs I mentioned above:

<script src="http://gist.github.com/791747.js"></script>

In my Blog index view that lists recent entries, I have a RouteLink that points to the route I want. In this example, I’m using the “BlogPost2” route from above:

<script src="http://gist.github.com/791748.js"></script>

Now that I have the URL shaped the way I want it, I can add constraints too. For example, I may want to constrain the year/month/day to be 4/2/2 digits.

I’d love to be able to call my customer back and tell him, sure, you can have yoursite.com/Monkey/Banana/MethodOfConsumption without the .aspx and I won’t charge you a dime!