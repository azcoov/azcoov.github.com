---
layout: post
title: "Building the same app for iOS and Android"
excerpt:
  Here's a quick rambling on my experience as a .net dev building Nearby Now for iOS and Android. I had a blast, learned a ton, and developed a love hate relationship for other platforms.
---

Here's a quick rambling on my experience as a .net dev building [Nearby Now](http://www.nearbynow.co) for iOS and Android. I had a blast, learned a ton, and developed a love hate relationship for other platforms.

I'm going to break this post down into three main sections that I feel are most important to talk about. Before I begin... Please note that while I am a .net developer, I'm an Apple fanboy, and never thought I'd develop for Android, or own an Android device. In other words, I had bias against Android prior to developing for it. Take anything negative I have to say about Android with a grain of salt.

Here are the three main discussion points: `Development Experience`, `Testing & Release`, `App & Device Experience`.

##Development Experience

*For iOS I used Xcode 4.2. For Android I used Eclipse Indigo Service Release 1. The iOS app was built first, then Android.*

From start, to app in testers hands, it took 12 days to build the iOS version and 6 days to build the Android version. This is based on my git commit logs. *A day is equal to 2 to 5 hours of coding*

So it took twice as long to build the iOS version? Well, yes but there are logical reasons for that.

*   I had a hell of a time with Xcode and Git. It's probably me but I spent way more time working on messed up merges between my two dev boxes than I should have.
*   For a .net programmer, writing Java is like writing C# the long way. It's like using Re-Sharper in C# for a year and then having someone take it away from you. My learning curve on Java was much lower than Objective-c. I also took the same Java classes in college that you did so I too can write you the best damn mortgage payment calculator in Java.
*   Objective-c - I still scratch my head sometimes. Do I bracket? Do I dot? .h files are annoying. However, I'm now a lover of the delegate pattern!
*   I did not have to spend time designing or wire framing because we already did that for the iPhone and wanted the Android app to be as similar as possible while maintaining platform usability standards.
*   [Barry](http://www.twitter.com/azcoastal) built our API and we had all the methods we needed before we started on Android.
*   I left out a view on Android that we built for iOS. It's a custom view that renders a translucent polygon service area on top of a map based on checkin data for the user, or the user's company. I did this because we had already been working on new features for the iOS app and we felt it was more important to ship the Android app with the new features rather than a nice-to-have view. I'll add that in the next release (famous last words).

I remember Uncle Bob calling Visual Studio a Yak...
<blockquote class="twitter-tweet"><p>Visual Studio is a Yak with hair that grows faster than you can shave it.</p>&mdash; Uncle Bob Martin (@unclebobmartin) <a href="https://twitter.com/unclebobmartin/status/7174132432" data-datetime="2009-12-29T22:30:50+00:00">December 29, 2009</a></blockquote>
<script src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

I thought about that as I was building for these two platforms. I'm not sure what Uncle Bob is using as his IDE these days but there are a couple of things that come to mind.

*   He hasn't used Visual Studio 2010, with [NuGet](http://nuget.org/), and all the awesome plugins we have now. The tweet was from 2009. I wish he'd give it another try.
*   I'd call the version of Eclipse that I'm using now more Yaky than Visual Studio 2005. That's not good.

Turns out, Xcode is great. It's clean, simple, fast. About the only thing that would be better is if I could have built the app in [Sublime](http://www.sublimetext.com/). Xcode has improved tremendously since I last used it (about three years ago). 

###XML meh, Storyboard FTW!

I never enjoyed Silverlight or WPF much. I shipped a WPF app a couple of years ago. I've dabbled a little in Windows Phone stuff. One thing that bugs me, because I'm a little insane, is laying out views with XML. I don't think it's XML that's the problem but rather the horrendous support IDE's have for designing them without doing it directly in markup. It reminds me of the drag-and-drop bloat of asp.net 1.1, where you'd drag a datagrid onto a form and 500 lines of code later you had this incomprehensible chunk of HTML that made no sense. Same sort of thing with XML layouts.

For building basic views (Nearby Now doesn't really have "advanced" views), I tip my hat to Xcode. The storyboard feature is absolutely amazing. I'm a visual person so laying out application flow in a storyboard makes a ton of sense to me. Add in the fact that you can wire-up your transitions right from the storyboard and you've got a winner. I spent a lot less time in Xcode working on the UI than I did in Eclipse. I love seeing a birds-eye-view of the application flow and that's what the storyboard gets you.

###Resources

Both iOS and Android have decent documentation. I ran into issues where I'd find examples, or documentation, that were outdated for the version I'm compiling against. API documentation is becoming irrelevant though. For every stumble I had, [StackOverflow](http://stackoverflow.com/) came to the rescue. I wish most major API vendors would just move their documentation to the [StackExchange platform](http://stackexchange.com/) and let the community sort it all out.

##Testing & Release

I was a little more careful and thorough with iOS testing. I think I had a built-up fear of our app being rejected and read all the horror stories from other devs. Sure enough, our app was rejected the first time. Here's the cool thing about that... Say what you will about the app store review process but it actually saved our ass. We had an embarrassing bug that we never found during testing. Even our remote testers never ran into this bug. It was an edge case and Apple found it and rejected us. Had they approved the app with that bug, it would have been an embarrassing launch for us. So I'm thankful. I can't complain about free quality testing.

###Testflight

[TestflightApp](https://testflightapp.com/) is amazing. If you aren't using it in your apps, you should. Without live crash reports, we are all blind to how our app performs in the wild. To release a build, and watch testers from all over the country open your app, and hit checkpoint after checkpoint, is a great feeling. You also get to observe the different ways people navigate your app. Another cool thing you can do with Testflight is is A/B test. Let's say you want your users to focus on a main function (checking into a location in our case), you can create separate builds that have altered flows designed to see which flow gets users from launch, to that function, the fastest.

Testflight is for iOS only, which is a shame. I hope they are working on an Android and WP7 version. I don't know what their pricing model is going to be but if anyone from that team reads this they should know that I'd pay a lot of money for what they offer.

###Code signing sucks

iOS, Android, ClickOnce, pfft. Code signing sucks on every platform it seems. Why can't this be easier? The IDE should handle everything for me automatically based on my build configuration (debug or release). I should have to enter my Marketplace or iTunes credentials one time in the IDE and never have to worry about it again. I should not have to drop down to the command line to find my MD5 fingerprint, for each build configuration, just to get a Google Maps API Key. Shipping mobile software is more complicated than it should be. It feels old. Very old.

###Emulators & Debuggers

I think perhaps five of the six days it took me to build the Android version was time spent on me waiting on the emulator to start. It's obnoxious! I didn't go buy an i7, with a boatload of ram and an SD, so that I could sit and wait on things. The Xcode emulator runs. **Fast**.

Where Eclipse shines in my opinion is debugging. I'd prefer a more fluid experience when moving from one perspective to another (like Visual Studio) but the amount of information available to you, and the different widgets and plugins you can use to help test the device was killer. At times I struggle in iOS to find the source of an app crash. In Eclipse, LogCat is great. I never had an issue tracking anything down.

##App & Device Experience

*I used an iPhone 4, and Droid X for local testing*

Aside from the annoying code signing stuff, and throwing some money at Apple & Google, setting up the devices for testing is straight forward. I prefer testing on the actual device over the emulator on both systems. Using your mouse to trigger scrolling with inertia feels unnatural.

The iPhone blows the Droid X away in several ways. It's faster. Transitioning from view-to-view, and scrolling is more fluid. There is never any lag. We know there is [debate as to why that is](http://www.forbes.com/sites/sap/2011/12/09/google-to-ex-intern-on-android-screen-lagginess-youre-wrong/) for Android but, I can say with 100% certainty, there is a problem and it's annoying. I have an iPhone that's loaded up with a ton of crap, and a Droid that has just a few apps on it with little running in the background. You'd think I'd be able to scroll through email, with a little inertia, and have that awesome experience. Instead, what you get is a choppy, laggy experience. I don't know, maybe not everyone notices this. Maybe the big ass screen on the Droid X is enough for most people to deal with the lag. By the way, while I love the retina display on the iPhone, I do like the large screen on the Droid X.

![Nearby Now for iPhone and Android](https://s3.amazonaws.com/assets.coovtech/nearbynowforiphoneandadnroid.png)

##What's next?

Oh, I don't know. We have plenty to to. We are building plugins for WordPress, Facebook, and a few other things. We have Apps galore now! Everything we've built so far is for service professionals. We plan on building consumer facing apps too. I suspect Windows Phone 7 might be our next target in the coming months. I don't think a BlackBerry app will see the light of day but that's ok because [Barry](http://www.twitter.com/azcoastal) built a kick-ass mobile version that works well for Black Berry.

November and December were some of the best times I've had in my software development career. I love learning new programming languages but to build and ship two new apps, in different programming languages, and to have them used by real people in the wild is an amazing feeling.

###Shameless plug

If you are a service professional looking to extend your local reach, [Nearby Now](http://www.nearbynow.co) was build for you. Both apps are free. Please give them a try:

<a href="http://itunes.apple.com/us/app/nearby-now/id484145186?ls=1&amp;mt=8"><img src="https://s3.amazonaws.com/cdn.nearbynow.co/images/App_Store_Badge.png" alt="Nearby Now for iPhone"></a>

<a href="http://market.android.com/details?id=nearby_now.android"><img src="http://www.android.com/images/brand/60_avail_market_logo2.png" alt="Available in Android Market" /></a>