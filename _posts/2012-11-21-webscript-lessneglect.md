---
layout: post
title: "Make your favorite web API cross platform"
excerpt:
    I've built many applications that require a server, a database, and deployments, just to pass a few bits of data around. Also, when I want to integrate with API's like [Twilio](http://www.twilio.com) and [Stripe](http://www.stripe.com), I have to pull down gems, and nugets, and libraries, and their dependencies, oh my. It's completely overkill if you ask me; there has to be a better way.
---

I've built many applications that require a server, a database, and deployments, just to pass a few bits of data around. Also, when I want to integrate with API's like [Twilio](http://www.twilio.com) and [Stripe](http://www.stripe.com), I have to pull down gems, and nugets, and libraries, and their dependencies, oh my. It's completely overkill if you ask me; there has to be an easier way...

##Turn that API into a cross-platform endpoint

I'm going to dig into the [Less Neglect](http://www.lessneglect.com) API a little because it's my favorite right now. We could all do customer service better and that's what these guys aim to do so I've been integrating my apps with Less Neglect one-by-one.

###Why Less Neglect?

Let's say that you've built an iOS or Android app. This app communicates with your backend server to grab a few small bits of data. Perhaps you also use [Test Flight](http://www.testflightapp.com) to capture a user passing a checkpoint, or the user encountering an error. Perhaps you also send data back to your own server when the user changes something, like updating their profile. That's great, but what do you do with that information? Do you have a relationship between the user saving their profile information, and the various checkpoints that lead up to it? Is support integrated? If so, how integrated?

What if you need to communicate with that user? What if there is an actionable trend on that users recent behavior? What kind of insight do you have about that customer other than a link to their Twitter feed and past tickets they may have entered? You probably use [Zendesk](http://www.zendesk.com), or a similar service, but help desk ticket systems are great for reactive support, not proactive support...

Less Neglect focuses on enabling you to build more context around your customers and how they are interacting with your product or service. A good example how they make your customer service better is their Stripe integration. How do you track failed payments now? Does your current helpdesk solution do this for you? I bet you had to roll your own or pay a contractor like me a bunch of money to deliver a custom solution because you didn't know there was a service that makes this super simple. If you are using Stripe, you connect your Stripe account to your Less Neglect account and BOOM, instant proactive alerts and prioritization of your customers. Now you can reach out to that customer early and proactively get to the bottom of the failed payment. You know you want this insight but you don't have the time or budget to integrate this type of analysis. Well, Less Neglect built their product for you. Go [sign up](http://www.lessneglect.com)!

###Ok, enough Less Neglect pitch, lets talk integration.

For Less Neglect, there is already an iOS library that makes integration simple. But what if you have apps for iOS, Android, Windows Phone, and Blackberry? What if you also have web apps for your product and they all work together? So you have to pull down the Less Neglect iOS library, Ruby gem, the C# library, and hope someone gets cracking on the libraries for Blackberry and Android that don't exist yet so that you can **Less Neglect all the things**. That's a lot of libraries to maintain and that's overkill for such a simple thing we are trying to do!

What if you could consolidate all of these libraries into a single web request that was cross platform and reqired no gems, or libs, or nugets, or anything? I know what you are thinking... "I'll just build a rails app that integrates with Less Neglect and acts like the API for all my other apps. This gives me a single URI for all my entities." Well, you are right! But what if you could have this consolidated web API without ever having to deploy and maintain a server?

##Now Were's Talking!

Enter [Webscript.io](http://www.webscript.io). I talked about doing push notifications with Webscript [four days ago](http://coovtech.com/posts/push-with-web-script/) (yes, I'm obsessed). Now that I've had more time to kick the tires I'm really beginning to appreciate the power this service provides.

The best part of Webscript.io, in my opinion, is their [modules](https://www.webscript.io/documentation#modules) feature that lets you build reusable Lua scripts that are hosted on GitHub. Since making Outbound HTTP requests with a webscript is super simple, I decided to [make a module](https://github.com/azcoov/webscript-lessneglect) specifically for Less Neglect. Here's what the webscript.io module looks like:

    local HOST = 'https://lessneglect.com/api/v2/%s'
    local log_event = function (PROJECT_CODE, PROJECT_SECRET, name, email, event)
        local event = {
            ['person[name]'] = name,
            ['person[email]'] = email,
            ['event[name]'] = event,
            ['event[klass]'] = 'actionevent'
        }
        return  http.request({
            method = "post",
            url = string.format(HOST, 'events'),
            auth = {PROJECT_CODE, PROJECT_SECRET},
            data = event
        })
    end
    return { log_event = log_event }

Now you can include this module in any webscript by simply requiring it. So back to our apps... Our iOS, Android, Blackberry, Windows Phone, and web app all provide the user with the ability to update their profile. So I created a webscript specifically for that purpose. Here's what that looks like:

    local ln = require('azcoov/webscript-lessneglect/ln.lua')
    local PROJECT_CODE = 'less neglect project code'
    local PROJECT_SECRET = 'less neglect project secret'
    ln.log_event(PROJECT_CODE, PROJECT_SECRET, request.form.email, request.form.name, request.form.action);

So now, when I want to capture the user updating their profile form all the various apps I have, I have a single URI endpoint to hit with an HTTP POST, rather than many different gems and libraries and whatever.

**No dependencies** to keep track of. **No changing versions** because I control the endpoint. **No deploying code**. **No downtime**. In the example above, the credentials to Less Neglect don't reside in my various apps but rather in the webscript that I maintain (Yes, you can secure your webscript). If I need to make a change, I only have a single place to make it and all my apps are instantly using the new change.

So there you go!

*disclaimer: No animals were harmed in the making of this blog post, but a few dynos were killed while I freed myself from unnecessary servers.*
