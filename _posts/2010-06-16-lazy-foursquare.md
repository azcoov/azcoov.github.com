---
layout: post
title: "Lazy Foursquare"
excerpt:
  Let's face it, we humans (well most of us), don't like doing repetitive tasks. Things become tedious and tedious creates burnout. This can be observed by watching me clock-in at work. Sometimes I remember, sometimes I don't. Well, most of the time I don't. I forget to do it. I forget to do it because I think the process is silly. With all the integration possibilities, I often wonder why one of us hasn't hooked into the badge system to build an auto-clock-in interface with our timecard system.
---

Lazy Foursquare? What can possibly be lazy about Foursquare? You go somewhere, you check-in, your done.

##Human nature and repetitive tasks

Let's face it, we humans (well most of us), don't like doing repetitive tasks. Things become tedious and tedious creates burnout. This can be observed by watching me clock-in at work. Sometimes I remember, sometimes I don't. Well, most of the time I don't. I forget to do it. I forget to do it because I think the process is silly. With all the integration possibilities, I often wonder why one of us hasn't hooked into the badge system to build an auto-clock-in interface with our timecard system.

Here is my problem with Foursquare on the iPhone. I’m at a venue, like work, and I forget to check-in. I find checking-in tedious in some ways. I don’t have an iPhone 3gs so apps are a little slow to launch. The app crashes sometimes. The app also seems slow to target my location at times. So the process is tedious at times and that is why I forget to do it.

##Programmers are lazy

A good friend and co-worker of mine (@krogden) says that the best programmers are lazy and that they will write code just so that they can be lazy. So that’s what this is about. I’m lazy and I wrote a program to do something for me so that I can continue being lazy.

##What does it do?

Simple. It checks me into work twice a day. Nothing more, nothing less.

##But why?

I’m a competitive person and I like to win (even if its not a game). Another good friend and co-worker of mine (@portiad) got hooked on Foursquare and ousted me as mayor at work. She has a deep drawer with an efficient filing system (that’s code for she doesn't forget things) and doesn't miss check-ins as often as I do.

It’s my mission to take back mayorship. Even if its a hostile takeover. Oh, and I also wanted to play with the Foursquare API. After all, programming is fun…

##The code

Foursquare made a great API that is simple to use; just a few lines of code. I simply make check-in calls to the Foursquare API using basic HTTP authentication. I wrote an app that will make check-in calls for me twice a day (once for when I get to work, and once for when I return from lunch), five days a week.

I read the "Rules and Conduct" in the Terms Of Use section on the Foursquare website. I wanted to make sure that by being lazy, I was not violating their terms. What I’m doing is honest (loosely), efficient, and accentuates my laziness, but does not break any rules as far as I can tell.

	Uri uri = new Uri("http://api.foursquare.com/v1/checkin.xml");
	String username = "";
	String password = "";
	String usernamePassword = username + ":" + password;
	CredentialCache mycache = new CredentialCache();
	mycache.Add(new Uri(uri.ToString()), "Basic", new NetworkCredential(username, password));            
	HttpWebRequest request = (HttpWebRequest)WebRequest.Create(uri);
	request.Credentials = mycache;
	request.Headers.Add("Authorization", "Basic " + Convert.ToBase64String(new ASCIIEncoding().GetBytes(usernamePassword)));
	request.Method = "POST";
	request.ContentType = "application/x-www-form-urlencoded";
	String postData = "vid=[the venue id of my office]";
	byte[] byteData = UTF8Encoding.UTF8.GetBytes(postData);
	request.ContentLength = byteData.Length;
	using (Stream postStream = request.GetRequestStream())
	{
	    postStream.Write(byteData, 0, byteData.Length); 
	}
	using (HttpWebResponse response = request.GetResponse() as HttpWebResponse)
	{
	    StreamReader reader = new StreamReader(response.GetResponseStream());
	    Console.WriteLine(reader.ReadToEnd());                
	}

And that’s it…

** Update **

Within two days of running the lazy Foursquare app, I took back mayorship of one our venues (we have two). Mission accomplished!