---
layout: post
title: "Wordpress Permalink Hell"
excerpt:
  So I just updated a wordpress site that I created for the Nearby Now plugins. It's just a basic site we put together to feature some of the various plugins we've built for Wordpress and Facebook, and to show examples of those plugins in action. I made a change that screwed things up for about an hour.
---

*disclaimer: I'm a wordpress noob, which explains why what you are about to read below happened*

<p itemprop='description'>
	So I just updated a wordpress site that I created for the Nearby Now plugins. It's just a basic site we put together to feature some of the various plugins we've built for Wordpress and Facebook, and to show examples of those plugins in action. I made a change that screwed things up for about an hour.
</p>

We've got a few decent pages in there that feature the plugins with examples and installation instructions. I'd call it done, save a style upgrade, for what we needed it for. 

Wordpress is a fantastic CMS. I've written my own blog engines, used Blogger, Posterous, but from a CMS perspective, I'm a fan. It's easy to setup and the plugin community is fantastic. If you have some pages you want to manage, and maybe a blog, then this thing is for you. You can even hook into things like [Stripe](http://www.stripe.com) if you want to turn your CMS into an e-commerice site with little effort.

But that doesn't mean I know how to use it...

##Crash and Burn

I wanted to update the URl structure to be user friendly. Something like http://www.sitename.com/webpagename or http://www.sitename.com//blog/posttitle - I know it's limited but the content here is going to stay fairly static except for any new plugins we create, or instructions we update.

So I went into the Wordpress admin site, changed the permilink structure and clicked save.

##BAM!!!

500 errors everywhere, I mean everywhere. The site pages, the blog posts, the admin pages, even PHP admin was toast. I was pissed. We also just released a new plugin for Wordpress, posted on the Wordpress plugin site, emailed some customers about it, so you could imagine the panic. I was angry that I made a change like that in production after just driving traffic there. Oh well, live and learn.

##The Fix

I did some research but I did not find a definitive answer as to why this happened, and searching for the fix was comical. I finally realized that is was probably a database issue since most everything in Wordpress is db powered.

I fired up the terminal, connected to our linux server, then mysql, the tried to find where that `/%postname%/` value is stored. This probably takes a normal Linux/Wordpress guru 5 seconds. I touch linux and mysql about once a year so each time connect, I have to re-learn the commands.

Anyway, I whacked that value and all is well. Hopefully if you run into this issue, my post helps you find the problem faster than I did.

I'm not done. I'm going to get the permalink working my way. I'll post back here when I get to that.