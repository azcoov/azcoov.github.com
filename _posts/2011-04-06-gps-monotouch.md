---
layout: post
title: "iPhone GPS location with MonoTouch"
excerpt:
  My first ever hack-a-thon was a failure. Why? Because the battery on my laptop ran out after about 40 minutes... I suck. Here was the challenge... We were trying to come up with a way for customers to start using [SideBox](http://www.sidebox.com/) and feeding hyper-local search, even if our full-service product is not complete/polished, or customers weren't ready to take the plunge.
---

My first ever hack-a-thon was a failure. Why? Because the battery on my laptop ran out after about 40 minutes... I suck.

Here was the challenge... We were trying to come up with a way for customers to start using SideBox and feeding hyper-local search, even if our full-service product is not complete/polished, or customers weren't ready to take the plunge.

We needed check-in support from the web, and check-in support from the iPhone (Android & Windows Phone 7 too, but later). Barry tackled the web and I took the iPhone. Barry finished the web side (and database) and it kicks ass.

After I charged my battery <shakes head in shame> I was able to finish what I started.

I decided to go with [MonoTouch](http://monotouch.net/) and [MonoTouch.Dialog](https://github.com/migueldeicaza/MonoTouch.Dialog) again because it's really freaking easy to use. How easy? Well, to create the fully functional UI that fetches the current location and displays on screen is less than 50 lines of code:

<script src="http://gist.github.com/907167.js"></script>

Using MonoTouch.CoreLocation we fetch the current location, and return a location object and bam, this is what we get:

<img src="https://s3.amazonaws.com/assets.coovtech/Billy_Coover_MonoTouch_MonoTouch.Dialog.png.scaled700.png">

Here is the [source code](https://github.com/azcoov/MonoTouch-CoreLocation-Example). Give it a whirl. You can use the [iTouchMap](http://itouchmap.com/latlong.html) website to test the accuracy of the latitude and longitude that you retrieve from the CoreLocation call. Mine is very accurate which is why I blurred out my longitude. I don't want Facebook stalkers coming over.

Throw a watch on that GitHub project if you want to see some other things I'll add to it over the next couple of days (a map and perhaps I'll integrate with Google's location data to show annotations of nearby businesses).

** Update ** 4/7/2011 12:30 pm

I found this [gem of an application](https://github.com/conceptdev/Monospace09) that was built for the monospace conference a couple of years back. I was able to take the code, tweak it, and make it useful in my example in just a couple of minutes. Want to know how far away you are from my [favorite watering hole Hero's](http://herosaz.com/)? BOOM

<img src="https://s3.amazonaws.com/assets.coovtech/Screen_shot_2011-04-07_at_12.25.36_PM.png.scaled700.png">