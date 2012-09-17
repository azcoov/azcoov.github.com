---
layout: post
title: "An iOS library for Less Neglect"
excerpt:
  Building a fluid communication channel between your app, and your customers, is difficult and time consuming. That's why I really like what [Less Neglect](http://lessneglect.com/) has done with their new Customer Analytics & Support API. 
---

Building a fluid communication channel between your app, and your customers, is difficult and time consuming. That's why I really like what [Less Neglect](http://lessneglect.com/) has done with their new Customer Analytics & Support API.

##How I Typically do Support

In the past, I've hooked up apps like [Desk.com](http://www.desk.com) & [Get Satisfaction](https://getsatisfaction.com/) for customer support, in combination with [TestFlight Live](https://testflightapp.com/sdk/live/), to provide a way for customers to reach me, and to also monitor user engagement inside my iOS apps.

While both of these apps are very nice, they don't really fit a customer relationship model. Desk.com is a very nice help-desk app, and TestFlight is great for tracking events and ad revenue inside your app. But how do you tie the two together? How do you build a relationship with your customers, not just provide a helpdesk, and how do you track important events that happen with your customers and keep both event data, and customer interaction data in the same place?

##Proactive Support, the Better Alternative
[Less Neglect](http://lessneglect.com/) makes this type of customer engagement easy with a super-simple API. Less Neglect is less about being a reactive help-desk and more about real-time pro-active customer engagement.

Less Neglect suggests you begin with a list of [fifteen events](http://lessneglect.com/api/quickstart#) which include account events, user events, and customer activity. For example, an account event might be a new customer registration, or a customer deleting their account. A user event, which is more along the lines of what you might use TestFlight for, might be user loggedin, user updated profile, user ran into an error on the site.

Every application is different so you'll probably have many of your own events you'll want to track. I've been using [Twilio](http://www.twilio.com) and [Stripe](http://www.stripe.com) in just about every application I've built over the last year. It makes sense for me to want to send an event message to Less Neglect for things that touch Stripe such as plan upgrades or failed payments that come back via Stripe web-hooks.

A good use-case example is the Twilio integration that I did with [Alerts for Stripe](http://www.pay-pad.com/alerts). There is a magic number of SMS messages that a customer can receive each month that would have me breaking even. When a customer hits the break-even threshold, I'd fire off an event to Less Neglect with the customer record. I might consider upping the customer's account_level as well. Boom! automatic tracking of my highly engaged customers!

##The iOS Library
I have [an app](http://www.pay-pad.com) that I wanted to trigger events and messages directly, rather than from my backend server. So I [built a simple iOS Library](https://github.com/azcoov/lessneglect-ios) that makes this process easy.

Simply [download](https://github.com/azcoov/lessneglect-ios/downloads) the Library, drag the LessNeglect folder into your project and start sending events and messages.

Here is an example of sending a new customer registered event:  

    LessNeglectConnection *con = [LessNeglectConnection connectionWithCode:kProjectCode key:kAPISecret];
    Person *person = [[Person alloc] init];
    person.email = @"name@example.com";
    Event *event = [[Event alloc] init];
    event.name = @"registered";
    event.note = @"customer signed up from xyz campaign";
    event.person = person;
    [con createActionEvent:event success:^(NSDictionary *response) {
        NSLog(@"Winnning!");
    } error:^(NSError *error) {
        NSLog(@"Not Winnning.");
    }];

Check out the [README](https://github.com/azcoov/lessneglect-ios/blob/master/README.md) for more information on how to integrate. Also, please feel-free to add to the library!

Less Neglect also has two client libraries for [Ruby](https://github.com/lessneglect/lessneglect-ruby) and [.NET](https://github.com/lessneglect/lessneglect-dotnet) that you should checkout if you want to communicate server-side. 

