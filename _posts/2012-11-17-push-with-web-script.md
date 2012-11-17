---
layout: post
title: "Server-less Stripe push notifications with webscript.io"
excerpt:
  If you haven't heard of [webscript.io](http://webscript.io) yet, it's an interesting new service that lets you write [Lua](http://www.lua.org/about.html) scripts that respond web requests, and gives you a URL endpoint to execute the script.
---

If you haven't heard of [webscript.io](http://webscript.io) yet, it's an interesting new service that lets you write [Lua](http://www.lua.org/about.html) scripts that respond web requests, and you gives you a URL endpoint to execute the script.

I recently launched iOS push notifications for [Pay Pad for Stripe](http://www.pay-pad.com). To do that, I had to spin up a new rails on app Heroku that processes [Stripe](http://www.stripe.com) Webhooks. Not that big of a deal because Heroku deployment is really simple. However, running a full-blown rails app on Heroku feels like over-kill when all I'm really doing is acting as proxy between Stripe and [UrbanAirship](http://www.urbanairship.com). Sure you could make a sinatra app, or whatever thin app you favor, but still, you are going to `git push heroku master` every time you want to make a change.

After watching the intro video on [webscript.io](http://webscript.io) I realized a webscript could do everything I needed to push notifications from Stripe webhooks. So lets build it shall we?

*(This assumes that you already have a [Stripe](http://www.stripe.com) account and an [UrbanAirship](http://www.urbansirship.com) account, and that you know how to setup iOS APN's ([Apple Push Notifications](http://developer.apple.com/library/mac/#documentation/NetworkingInternet/Conceptual/RemoteNotificationsPG/ApplePushService/ApplePushService.html)) in Objective-C)*

##The Push Notification Script
I think you'll be blown away by how simple this script is.

<script src="https://gist.github.com/4101151.js"> </script>

Ok so here's what this code does. First, it parses the incoming Stripe webhook. It then takes the event id from the webhook and calls back to the Stripe events API to get the full event details. This is a best practice for processing Stripe webhooks. Next, we parse the response from Stripe and specifically look for the `charge.succeeded` event in the response body. Next we build a Lua table called `payload` that represents the parameters we are going to POST to UrbanSirship [iOS Push API](https://docs.urbanairship.com/display/DOCS/Server:+iOS+Push+API). For the alert, we are going to push a friendly message with the amount of the charge. Finally we convert our `payload` table to a JSON-encoded string and POST it to UrbanAirship.

Once you have the script ready, you can point your Stripe app to your webscript.io url endpoint which look like this: `http://demo-{code}.webscript.io/{script-name}`. When you are ready, create some charge.succedded transactions on your Stripe test account and poof, you've got push notifications!

##Gotchas
One of the things that I struggled with was setting the header Content-Type to application/json, which is required by UrbanAirship. It took me a while to realize that the format needed to be passed into the headers table as `['Content-Type']`. I tried `Content-Type`, `content_type`, and `"Content-Type"` before I figured it out. The Content-Type is set to application/x-www-form-urlencoded by default.

##Is this production ready?
Surprisingly, I'd say yes, though with a guarded tone. I've done zero due diligence regarding security or scalibility for webscript.io, but I trust [Steve Marx](https://twitter.com/smarx), so there you go!
