---
layout: post
title: "Twitter Style jQuery Toaster"
excerpt:
  I was working on a project where I needed to display a confirmation alert to the user. I'm tired of the inline div's and facebox dialogs but was having a difficult time finding an alternative. Then I remembered I really liked the way Twitter confirmed changes to the user profile so I thought I would make my own version that I can use in my asp.net mvc apps. 
---

I was working on a project where I needed to display a confirmation alert to the user. I'm tired of the inline div's and facebox dialogs but was having a difficult time finding an alternative. Then I remembered I really liked the way Twitter confirmed changes to the user profile so I thought I would make my own version that I can use in my asp.net mvc apps.

I started messing around with a sliding div that would allow me to pop messages onto the page but in a subtle way. My first implementation was simple. I added a function to my main javascript file that I could call from anywhere within my app.

<script src="http://gist.github.com/805409.js"></script>

My buddy (err boss) Barry thought it would be clever to pop this when we detected ajax errors.

<script src="http://gist.github.com/805410.js"></script>

As I was adding cool effects I thought that I should blog about what I was doing because it was fun. Then I thought, why not turn this into a jQuery plugin that others could use and or extend?

So i did!

[jQuery Toaster](http://plugins.jquery.com/project/Toaster) - a Twitter-like slide-down notifier.

You can download it from the [jQuery plugin site](http://plugins.jquery.com/project/Toaster).

The source-code is up on [GitHub](https://github.com/azcoov/jQuery-Toaster) if you are interested.

Here are some [live working examples](http://coovtech.com/projects/toaster) if you want to see it in action.

Check it out and if you have any comments about jQuery Toaster, you can post it to [Google Groups](https://groups.google.com/forum/?fromgroups#!forum/jquery-toaster), or the [GitHub issues](https://github.com/azcoov/jQuery-Toaster/issues) page.