---
layout: post
title: "{less} is more"
excerpt:
  I just spent the weekend updating CoovTech and Tekfolio with {less} css. If you haven’t heard of LESS, it’s a dynamic style sheet language that allows you to write much better CSS that compiles down to regular CSS.
---

I just spent the weekend updating [CoovTech](http://www.CoovTech.com) and [Tekfolio](www.tekfolio.me) with [{less} css](http://lesscss.org/). If you haven't heard of LESS, it's a dynamic style sheet language that allows you to write much better CSS that compiles down to regular CSS.

##Much Better?

What does that really mean? Well, for as long as I've been doing web dev, I've hated CSS. When working with C# or RoR, we live in a world where things are dynamic and it's simple to create variables, classes, methods, etc that are extensible and re-usable. Working with CSS has always been backwards. I remember the religious push to stop writing in-line styles, and it was for good reason. But having to write CSS and re-use the same color tags, for example, over-an-over was ridiculous. LESS let's you code CSS like you would expect from a native programming language. For example:
    @primary-color: #585858;
    body{
        color: @primary-color;
    }

You can imagine how many times you might use the #585858; color in your CSS file. It's a pain in the ass to remember that color and what if you want a similar color but slightly lighter? LESS let's you program in a more natural way:
    @primary-color: #585858;
    @secondary-color: @base-color * 3; 
    body{ color: @primary-color;}
    h2{ color: @secondary-color};

The amount of time savings you get is amazing. Imagine the last time you wanted to change font colors on a massive CSS file. ugh. With LESS, it's trivial. I encourage you to read more [about {less}](http://lesscss.org/) - things like mixins and functions will really cook your noodle.

##what's next?

I have a need to make LESS even more dynamic. For example, I need the ability to write LESS like this:
    @primary-color: @{PrimaryColor};
    body{color: @primary-color;}

Where @{PrimaryColor}'is a value that was fetched from the database. You can imagine a scenario where a client or user can specify certain layouts or themes and you want to store those values in a database and later inject them into a .less file. That's what I'm working on now ;)