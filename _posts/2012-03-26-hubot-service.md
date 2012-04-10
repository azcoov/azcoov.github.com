---
layout: post
title: "A Hubot inspired notification service"
excerpt:
  I dislike business reporting. I've been designing and building enterprise level business intelligence reports for the last seven years are so. I've never liked writing reports. Perhaps it is the formality of the report. Perhaps I wrote too many reports that I slaved over only to find out that the business folks either weren't running them, or didn't know why they needed them.
---

I'm a big fan of [Hubot](http://hubot.github.com/). If you have been interested in learning [CoffeeScript](http://coffeescript.org/), or [Node.js](http://nodejs.org/), I recommend getting your own Hubot and tinkering with the source code. Hubut does a few fun and interesting things. For example, you can ask Hubot to mustache someone and, assuming that person has an online presence, you'll usually something good back like this:

![Hubot mustache me billy coover](https://s3.amazonaws.com/assets.coovtech/hubot5.png)

*(Note, hubot is not magically mustaching people. Hubot is using web api's for most things, including [mustacheing people](https://github.com/afeld/mustachio). Read the source code, it will make sense)*

But this post is not about the fun things that Hubot can do. After all, you'll never get your boss to approve of having your own Hubot if all Hubot does is mustache people. Unless you mustache someone your boss hates, then maybe you'll have a strong case for it.

This post is about turning this awesome robot into your own intuitive reporting engine by writing push and pull scripts that Hubot can react to.

##Enterprise reporting sucks

I dislike business reporting. I've been designing and building enterprise level business intelligence reports for the last seven years are so. I've never liked writing reports. Perhaps it is the formality of the report. Perhaps I wrote too many reports that I slaved over only to find out that the business folks either weren't running them, or didn't know why they needed them.

I have a different take on reporting. One that takes the formality out of reporting and keeps you in the loop of what you need to know, when you need to know it. It's reporting the 2012 way.

##Data that you want, when you want it

In my opinion, information is best served in two ways. The first, and most important, is by push notification. I want to be alerted by things that I define as interesting or important that requires my attention. The second is by manual query. I want to fire-off simple queries that pull back the information I want without the hastle of writing a full-fledged report, or opening up some database management utility to get it. So, important information is pushed to me, and everything is a command away for me to fetch, should I want to.

Building the reports that I wanted ended up being incredibly easy. I started out by writing Hubot scripts to fetch the data I care about. I tell Hubot what to do from Campfire, and hubot will run the script that makes a call to my api server, parses the json response, and pastes a nicely formatted response back to Campfire:

![Hubot report example](https://s3.amazonaws.com/assets.coovtech/hubot3.png)

The code to make this happen is CoffeeScript and was simple to write. Here is the base script that the majority of my scripts are built from. It's a simple web request that parses the json result. In most cases, I just change the URL I'm pulling data from and either dump the response to Campfire, or parse the data in the response into something readable before I post to Campfire:

	query_url = "http://api.example.com/action}"

	module.exports = (robot) ->
	  robot.respond /command what/i, (message) ->
	      message.http(query_url)
	        .header('Content-Length', 0)
	        .post() (err, res, body) ->
	          console.log body
	          json = JSON.parse(body)
	          if json.success == true
	            message.send(body)
	          else
	            message.send(body)

Now this is great if you are inside Campfire all the time and you are actively thinking about your data. While I do have Campfire open all day, every day, I don't always sit in the room chatting with people and I'm not always thinking about my data. I wanted Hubot to go fetch data on a schedule without me asking Hubot to do it, and alert me if anything interesting has happened by posting the data into a "status log" chat room I have:

![Hubot report example](https://s3.amazonaws.com/assets.coovtech/hubot1.png)

Setting the alerts up was just as easy. While we aren't using Hubot for the actual push alerts, we are using the same type of script and API calls by throwing a rake file on it, and having Heroku fire the rake commands on a schedule. All inspired by Hubot.	

Here is what a typical alert Rake file looks like. We make similar API calls, parse the data in a similar way, and post it to campfire using a Campfire Ruby Adapter. Nothing too fancy here. I'm using a MySQL database to keep track of my last API calls and only pull data that's happened since the last call (I'm doing more with SQL but I've simplified the code for this example):

	require "rubygems"
	require 'mysql'
	require "tinder"
	require 'net/http'
	require 'json'
	require 'uri'

	desc "calls an API and posts the response data to Campfire"
	task :some_cool_action do
	   #create db connection & fetch last timestamp & compare current date > last_ran_on
	   db = Mysql.init
	   db.options(Mysql::OPT_READ_TIMEOUT, 60)
	   db.real_connect()
	   schedule = db.query("select last_ran_on from schedule")
	   row = schedule.fetch_hash
	   last_ran_on = row["last_ran_on"]
	   db.close

	   campfire = Tinder::Campfire.new 'username', :token => 'CampfireApiKey'
	   room = campfire.find_room_by_id(CampFireRoomId)

	   response = Net::HTTP.get_response(URI.parse('http://api.example.com?lastranon=' + URI.escape(last_ran_on)))
	   data = JSON.parse(response.body)
	   data.each do |slug|
	      room.speak "slug data example #{slug['Column1']}, #{slug['Column2']}, [#{slug['YouGetTheIdea']}]"
	   end

	   #stamp last_ran_on date
	   db = Mysql.init
	   db.options(Mysql::OPT_READ_TIMEOUT, 60)
	   db.real_connect()
	   statement = db.prepare("update schedule set last_ran_on = '" + DateTime.now.to_formatted_s(:db) +"'")
	   statement.execute()
	   statement.close

	   db.close
	end

The scripts are easy to modify later as you begin to scale. For example, lets say that you are posting real-time activity to your campfire room based on a new product you just launched. When you don't have a lot of activity going, it makes sense to post data as it comes in. Later on, when your user base and server activity grows, it probably will get annoying to have all that activity posted to Campfire. You can quickly change your scripts and API calls to provide a daily aggregate of useful information instead of real-time activity.

##Conclusion

Hubot is contagious. Once you start building things on top of the robot you can't stop. There is no end to how far you can take it. If there is a Web API out there, chances are you can find a useful way to talk to that API with Hubot. The best part is the Hubot scripts are simple to write, even if you don't know CoffeeScript. Just look at the first example above. Making an API call and posting the result to Campfire in a few lines of code. Fantastic. I built both the Hubot scripts and the Rake scripts in an hour or two and have been using them every day for the past six months. 