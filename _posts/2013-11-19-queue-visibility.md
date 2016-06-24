---
layout: post
title: "Queue Visibility"
excerpt:
  abcdefg
---

Nearby Now has been using [SideKiq](http://sidekiq.org/) for 120 days now in
production. That's odd, we are a .NET shop...

## SQL Queuing
Up until around 120 days ago, we were using SQL Server Message Broker. SSMB is appealing because it enables you to send asynchronous messages directly from your database code. You can target your own database, another db on the same server, or a remote server. There's a ton of features around transactions, locking, and security.

If you've never used it or seen in action I'd describe it as powerful, robust, and very complicated. Complicated to setup, complicated to maintain, complicated to change.

My two biggest problems with it has been the lack of tooling and monitoring, and cost. SSMB does not come with a turn-key monitoring solution or simple interface for creating new queues and messages. SSMB does not completely leave us in the dark. Everything in the message broker is queryable; we've rolled our own web interface to give us real-time stats.

The cost can be prohibitive if you want to run it on AWS; we'd be forced to run SQL Standard as Service Broker messaging is not available for the web version.

Also, I've struggled trying to come up with an efficient automated testing solution.

##SideKiq
While working at [Preact](www.preact.io) I got my first exposure to SideKiq and fell in love with it immediately.

SideKiq is powerful in a much different way than SSMB. As a small company we are always trying to find the most cost effective solutions as well as the most efficient use of our precious programming time. With SideKiq you build ruby scripts called Workers that accept simple messages (usually database object ids), then "queue" them asynchronously.

SideKiq uses multithreading so it can process on ton of message and is memory efficient. You have to really think multithreading through. Over in the service broker land, we get locking on conversation groups until the transaction commits. Taking messaging outside of the database means you have to take the lack of locking into consideration when designing your solution.

##Talking to SideKiq from SQL Server
Pushing our messages from the Service Broker over to SideKiq is actually simple. We've been building SQL CLR's for years and one of the generic CLR's we have let's you make an external web request with a payload.

So we setup a simple Sinatra app that acts as proxy between our SideKiq queue and the outside world. When we want to queue something, we just call our sp_external_post proc, which makes an encrypted HTTP POST to our proxy server, with a small non-data sensitive payload that includes worker instructions.

The Workers do various things. They can hit our database with a query, call our API server, talk to another external service like Twilio or Stripe, etc. The point is that we can do almost anything with it.

SideKiq comes with a slick real-time monitoring app built-in as well as a robust api that you can use if you want to hook it up to some type of dashboard like DucksBoard.

It's dirt cheap to run SideKiq.

##Plan to fail over
SideKiq has been stable but servers will be servers so I wanted to make sure we had a backup plan. The worst case scenario for us is a queue that stops accepting new messages.

To give us an alternative queue solution, I built the SQL CLR that posts external queue messages in a way that uses a common json payload format that allows us to utilize both SideKiq and [IronMQ](http://www.iron.io/). IronMQ has some redundancy features that turn it into about 4 additional external queue options for us. Our SideKiq Sinatra app understands the same json structure so the two are capable of processing the same types of payloads.

Our database has a table of external queue endpoints and a master control table that tells all calling programs which queue is active, as well as how to fail over. Any server that utilizes our queues gets this same information.

This new setup gives us the added benefit that we can now queue things from outside of the database. We have mobile apps out in the wild that are constantly hitting our API server. We leverage SideKiq/IronMQ to queue things up that might be a little slow and return fast so that our mobile apps stay snappy. This is a huge improvement in performance from where our mobile apps where a year ago.

I added a little extra monitoring around our setup. In addition to real-time alerts when things go wrong with all the various parts of the system, I built an iOS app that lets us see the status of our queues and switch the queue providers in real-time. In the rare occasion that our SideKiq queue seems to be running slower than normal, I can quickly send the workload to another provider and then dig in to find whats wrong.

As we continue to grow, this solution will probably have to change. It works really well for us today and it's been an order of magnitude easier for us to maintain and trouble shoot. Much easier than SSMB. Also, we've now positioned ourselves to move our SQL Database to AWS on SQL Web rather than SQL Standard. A huge cost savings for us.
