---
layout: post
title: "Create a Sparkline in ASP.NET MCV in 30 seconds or less"
excerpt:
  I’m building a new performance analysis system for our web traffic and was considering different ways to display the data. Anyone who knows me well knows that for the most part I despise reporting. Mostly because time and time again I’ve been asked to build reports that never get used. This time is different. This time I’m the audience so I get to build the report the way I think it should look.
---

I’m building a new performance analysis system for our web traffic and was considering different ways to display the data. Anyone who knows me well knows that for the most part I despise reporting. Mostly because time and time again I’ve been asked to build reports that never get used. This time is different. This time I’m the audience so I get to build the report the way I think it should look.

Several years ago I came across a website that had excerpts from Edward Tufte’s book [Beautiful Evidence](http://www.edwardtufte.com/bboard/q-and-a-fetch-msg?msg_id=0001OR&topic_id=1&topic=). I was interested in these things called Sparklines:

>He also refers to sparklines as “wordlike graphics” or“datawords”. A sparkline usually consists of either a fluctuating line like in a line chart, or of a string of very tiny bars. It is usually longer than high, and is not accompanied by an x- or y-axis or other scale. A sparkline enables the visual display of a large amount of data in a tiny space. In addition, sparklines are often presented in a set, enabling comparisons between the data in different sparklines

At the time I had the idea of adding these sparklines to our flagship application to help give users a better at-a-glance understanding of the health of the account they were working. I did end up implementing it but never released it because I never thought it conveyed the point that I was hoping it would make.

Fast forward a few years later and Google added [Sparkline capability to the Charts API](http://code.google.com/apis/chart/docs/gallery/line_charts.html) which makes it simple. I realized that most of the performance data that I had would be best explained with sparklines. Here is how I did and you should be able to implement this yourself in 30 seconds or less, I promise.

##Step 1 – Create an HTML helper

This is a quick hack to get you going. You could probably structure your code better and make it more readable and allows for incoming options as not everything we are sending Google in the query string is required.

<script src="http://gist.github.com/790542.js"></script>

##Step 2 – Add the Sparkline to your markup

This is a simple MVC View Page. Don’t forget to import your Sparkline.Helpers reference…

https://gist.github.com/790548

##Step 3 – Run it

<img src="http://chart.apis.google.com/chart?cht=lc&amp;chf=bg,s,bbbbbb&amp;cgh=0,50,1,0&amp;chds=1,9&amp;chs=150x30&amp;chd=t:1,3,5,2,7,9,4&amp;chco=999999&amp;chls=1,1,0&amp;chm=o,990000,0,20,4&amp;chxt=r,x,y&amp;chxs=0,990000,11,0,_|1,990000,1,0,_|2,990000,1,0,_&amp;chxl=0:|4|1:||2:||" _mce_src="http://chart.apis.google.com/chart?cht=lc&amp;chf=bg,s,ffffff&amp;cgh=0,50,1,0&amp;chds=1,9&amp;chs=150x30&amp;chd=t:1,3,5,2,7,9,4&amp;chco=999999&amp;chls=1,1,0&amp;chm=o,990000,0,20,4&amp;chxt=r,x,y&amp;chxs=0,990000,11,0,_|1,990000,1,0,_|2,990000,1,0,_&amp;chxl=0:|4|1:||2:||" alt="sparkline">

That’s it. It really is that simple… Maybe

Sparklines are easy to use if you have simple data points. You can take the code from above and change it around to better suit your needs. Perhaps you want a int array, or a simple string of comma delimited values to pass in. No problem.

At some point you’ll need to do some math. Why? Well, it depends on how you want to handle negative numbers.

Step 4 – Test it

Assume you have this series of numbers as your data point: 1,5,3,6,8,4,5,8,9,18,3.5,5,4,7,10,11,9,13,5,6,8

Your sparkline will look like this: <img src="http://chart.apis.google.com/chart?cht=lc&amp;chs=100x30&amp;chd=t:5.3,26.5,15.9,31.7,42.3,21.2,26.5,42.3,47.6,95.2,18.5,26.5,21.2,37.0,52.9,58.2,47.6,68.8,26.5,31.7,42.3&amp;chco=336699&amp;chls=1,1,0&amp;chm=o,990000,0,20,4&amp;chxt=r,x,y&amp;chxs=0,990000,11,0,_|1,990000,1,0,_|2,990000,1,0,_&amp;chxl=0:|8|1:||2:||&amp;chxp=0,42.3" _mce_src="http://chart.apis.google.com/chart?cht=lc&amp;chs=100x30&amp;chd=t:5.3,26.5,15.9,31.7,42.3,21.2,26.5,42.3,47.6,95.2,18.5,26.5,21.2,37.0,52.9,58.2,47.6,68.8,26.5,31.7,42.3&amp;chco=336699&amp;chls=1,1,0&amp;chm=o,990000,0,20,4&amp;chxt=r,x,y&amp;chxs=0,990000,11,0,_|1,990000,1,0,_|2,990000,1,0,_&amp;chxl=0:|8|1:||2:||&amp;chxp=0,42.3" alt="">

But what if you had a negative number in your series? Do you want your Sparkline to look like this <img src="http://chart.apis.google.com/chart?cht=lc&amp;chs=100x30&amp;chd=t:33.2,48.1,40.7,51.9,59.3,44.4,48.1,59.3,63.1,96.6,42.5,48.1,44.4,3.4,66.8,70.5,63.1,78.0,48.1,51.9,59.3&amp;chco=BBBBBB,336699&amp;chls=1,1,0|1,1,0&amp;chm=o,990000,1,20,4&amp;chxt=r,x,y&amp;chxs=0,990000,11,0,_|1,990000,1,0,_|2,990000,1,0,_&amp;chxl=0:|8|1:||2:||&amp;chxp=0,59.3" _mce_src="http://chart.apis.google.com/chart?cht=lc&amp;chs=100x30&amp;chd=t:33.2,48.1,40.7,51.9,59.3,44.4,48.1,59.3,63.1,96.6,42.5,48.1,44.4,3.4,66.8,70.5,63.1,78.0,48.1,51.9,59.3&amp;chco=BBBBBB,336699&amp;chls=1,1,0|1,1,0&amp;chm=o,990000,1,20,4&amp;chxt=r,x,y&amp;chxs=0,990000,11,0,_|1,990000,1,0,_|2,990000,1,0,_&amp;chxl=0:|8|1:||2:||&amp;chxp=0,59.3" alt=""> or this ?<img src="http://chart.apis.google.com/chart?cht=lc&amp;chs=100x30&amp;chd=t:29.5,29.5|33.2,48.1,40.7,51.9,59.3,44.4,48.1,59.3,63.1,96.6,42.5,48.1,44.4,3.4,66.8,70.5,63.1,78.0,48.1,51.9,59.3&amp;chco=BBBBBB,336699&amp;chls=1,1,0|1,1,0&amp;chm=o,990000,1,20,4&amp;chxt=r,x,y&amp;chxs=0,990000,11,0,_|1,990000,1,0,_|2,990000,1,0,_&amp;chxl=0:|8|1:||2:||&amp;chxp=0,59.3" _mce_src="http://chart.apis.google.com/chart?cht=lc&amp;chs=100x30&amp;chd=t:29.5,29.5|33.2,48.1,40.7,51.9,59.3,44.4,48.1,59.3,63.1,96.6,42.5,48.1,44.4,3.4,66.8,70.5,63.1,78.0,48.1,51.9,59.3&amp;chco=BBBBBB,336699&amp;chls=1,1,0|1,1,0&amp;chm=o,990000,1,20,4&amp;chxt=r,x,y&amp;chxs=0,990000,11,0,_|1,990000,1,0,_|2,990000,1,0,_&amp;chxl=0:|8|1:||2:||&amp;chxp=0,59.3" alt=""> 

Please give them a try yourself and have fun. Ping me back if you have done any neat things with Sparklines!

I built a sample app and [threw it on GitHub](https://github.com/azcoov/Utilities/tree/master/Sparkline). Please feel free to take it and run with it.