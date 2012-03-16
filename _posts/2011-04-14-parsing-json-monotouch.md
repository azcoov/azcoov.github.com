---
layout: post
title: "Parsing Json with MonoTouch and MonoTouch.Dialog"
excerpt:
  When i first started building the SideBox iPhone app, I tried to parse Json using native .net api's. I failed. Why? Well mostly because I did not know what I was doing, but also because I was under a pinch to bang it out quickly. Back then I decided to go with a port of the JSON.NET library called Newtonsoft.Json. It has worked well for me up until recently. I began processing some nested json with weird arrays and such and my Json parsing started breaking down. Probably my fault, but I again was in a pinch and needed to bang out a quick solution.
---

When i first started building the SideBox iPhone app, I tried to parse Json using native .net api's. I failed. Why? Well mostly because I did not know what I was doing, but also because I was under a pinch to bang it out quickly. Back then I decided to go with a port of the JSON.NET library called Newtonsoft.Json. It has worked well for me up until recently. I began processing some nested json with weird arrays and such and my Json parsing started breaking down. Probably my fault, but I again was in a pinch and needed to bang out a quick solution.

I knew that the MonoTouch.Dialog app named TweetStation was using System.Json so I took a peak at that source code and it turns out things have gotten really simple in .net for parsing. Here is an example of how I'm using System.Json to parse Json coming back from an HttpWebResponse, and creating an iPhone UI with a list of StackOverflow questions that lets you drill-down to the question's set of tags:

I'm using the StackExchange StackAppsAPI to fetch questions tagged with MonoTouch. Here is the entire source code to render this iPhone UI:

<script src="http://gist.github.com/921142.js"></script>