---
layout: post
title: "Creating a Site Map in MVC"
excerpt:
  I needed a to generate a site map today for some cool things we are planning for SideBox. I turned to, you guessed it, Stackoverflow and found a question about parsing an Atom feed with Linq which is exactly what I was looking for.
---

I needed a to generate a site map today for some cool things we are planning for [SideBox](http://www.sidebox.com). I turned to, you guessed it, Stackoverflow and found a question about [parsing an Atom feed with Linq](http://stackoverflow.com/questions/3193649/parsing-an-atom-feed-via-linq-to-xml) which is exactly what I was looking for.

Here is the code. I'm scraping content from Stackoverflow as an example:

<script src="http://gist.github.com/879061.js"></script>

Here are some important tips I learned about Google and how they process site maps:

- Sub domains - This will get you. If you have a domain such as www.coovtech.com and you want include content for your blog at blog.coovtech.com, you will need a separate site map for the blog.coovtech.com sub domain.
- Change frequency is not as it seems. If you tell Google your change frequency is hourly, don't count on the Google bots to crawl your site hourly.
- You can prioritize URL's relative to other URL's. So what does that mean? It just provides the Google bot a general guideline on the order in which it should crawl your site. I'm using the default in my example (0.05).

I'm hoping to get some good analytics from this. I'm looking to see if feeding Google updated site maps in real-time as new content appears has an impact on overall traffic to our site. I'm also looking for any change in page ranking as a result. I suspect there wont be but it will be interesting to watch.