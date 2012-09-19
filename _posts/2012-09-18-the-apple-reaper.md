---
layout: post
title: "The Apple Reaper"
excerpt:
  Apple has rejected the iPhone version of [Pay Pad for Stripe](http://www.pay-pad.com) and will remove the iPad versions.
---

***UPDATE***
Apple reached out to me this evening. They have [approved the app](http://coovtech.com/posts/the-apple-reaper/)! I'll update the blog post with more details tomorrow. 

I've been patiently waiting for Apple to approve the iPhone version of [Pay Pad for Stripe](https://www.pay-pad.com/). I released the iPhone version, and updates to the iPad versions, the same day back on September 2nd. The iPad apps were approved about eight days later, but the iPhone app stayed in review. I figured that the reason this happened was that reviews on an existing app go through a different QA process.

About four days later (13 days after I submitted the app), I received an email from Apple's review team that my app required more time to review. I've been in the financial industry for a long time and I know this term well... "Manual Underwriting". So I knew something was up, I just didn't know what. I was guessing that it might be a problem with me not bundling the application as a universal app. I was wrong.

##Meet The Reaper
Today I received an email from Apple that said they'd like to discuss my app with me. In the email, they referenced section 11.2 of the [Apple Approval Guidelines](https://developer.apple.com/appstore/resources/approval/guidelines.html). For those without access to the guidelines, here's what 11.2 says:

>Apps utilizing a system other than the In App Purchase API (IAP) to purchase content, functionality, or services in an app will be rejected.

I'm very confused with this email because Pay Pad for Stripe is not an app that takes money from it's users. It's an app to manage your Stripe account and also allows users to charge their own customers. So my app facilitates B2C transactions where Pay Pad for Stripe users are the "Business" and the people who would be charged by a Pay Pad for Stripe users are the "Customers". Sadly, no cash comes my way. So what's the problem?

Apparently the problem is that Apple sees my Stripe app as a directly violation of section 11.2 and feels that they are entitled to collect 30% of the transactions that would be processed from the app.

##Bat Shit Crazy!
Could you imagine, charging customers 30% to accept a payment? I thought it was a joke. I mean it seems obvious to me what my app does and that it does not apply to 11.2, but I'm biased. 

I'm annoyed, so for the sake of my own amusement, and to complete my little temper tantrum, I've listed how our phone conversation went:

I told him my name and why I was calling. He gave me a brief rundown of 11.2 and why my app violated it. I tried to explain to him what my apps does. No real response. Then this:

**Me:** "Do you know what Stripe is? Have you ever heard of them? They are based in SF"  
**Apple:** "No, never heard of them"  
**Me:** "Ok, have you heard of Square or PayPal, my app has similar features"  
**Apple:** "No, never heard of them"  
**Me:** "Seriously, you've never heard of Square or PayPal?"  
**Apple:** "There are over 700,000 apps in the app store. I just go through them one at a time"  

At this point I realize that I'm talking to a robot. Someone who's job is mechanical. There is no empathy. No desire to learn the details of my app. His decision has already been made before he emailed me.

**Me:** "So what are my options?"  
**Apple:** "You'll need to comply with 11.2 by implementing In App Purchases, or remove the feature"  
**Me:** "Wow, that's unbelievable. I can't understand how my app is related to 11.2 at all."  

He recites 11.2 to me. I again attempt to explain in detail how the app works, how Stripe works, and how we use Stripe with the various apps and products we have. He stands firm.

**Apple:** "Is your app cross-platform?"  
**Me:** "What do you mean?"  

I'm afraid to answer this question. I'm not sure where he's going with it.

**Apple:** "If your app is cross-platform, then 11.2 does not apply and this problem goes away"  
**Me:** "Really, so if I build an Android version and launch it, I'm good?"  
**Apple:** "Yes"  

Still shocked I again explain how I think it's crazy that this situation is happening and that there is no way 11.2 applies to my app. I'm not selling a product, a service, NOTHING! That went on for a couple of minutes longer until I give up.

**Me:** "So my two options are to release and Android version, or update my apps to remove this feature?"  
**Apple:** "Sounds like you have a plan"  

I've since sent two more emails requesting further clarification but I have not yet received a response. I did a Google search for this guy and it turns out I've been touched by the Apple Reaper. It's a sad day.

#What's Next
I'm going to climb whatever ladder I need to climb to squash this bullshit! Apple picked on a little guy; we can't stand for this!

**I'm kidding**. I don't have the time or energy to argue about it; I've wasted enough already. Writing this blog post satisfies my need to complain about it. It will take me 20 minutes to update the three apps and get them re-submitted. I don't have millions of users; no one will care. 

**"Onward!"**