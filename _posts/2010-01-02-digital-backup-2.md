---
layout: post
title: "My Digital Backup Strategy (redux)"
excerpt:
  I'm an amateur photographer. I've enjoyed taking pictures ever since I was a kid. About two years ago I purchased a Nikon D40 and started using the Flickr photo sharing service so that my wife and I could share our memories with our extended family. Since then I have uploaded over 15,000 high quality images to Flickr. 
---

I'm an amateur photographer. I've enjoyed taking pictures ever since I was a kid. About two years ago I purchased a Nikon D40 and started using the Flickr photo sharing service so that my wife and I could share our memories with our extended family. Since then I have uploaded over 15,000 high quality images to Flickr. 

The whole concept of Flickr was fascinating to me because it's a dirt cheap high capacity storage solution for media. It's backed by Yahoo! and has been a cinch to work with. I've never worried about the data because they offer paid DVD copies if needed. Also, there are third party solutions that do backups locally. Not to mention they provide an API so I could write my own program for off-site storage. 

Recently, something happened that exposed my backup weakness... 

I had several hundred photos on a machine that I was selling to a friend. I wanted to move those photos to Flickr but had not gone through and touched them up so I opted to move them to an external hard drive. 

About a month after I sold my old machine I bought a MacBook Pro. The first thing I wanted to test was the TimeMachine backup utility. I already had an external hard drive and figured I could use it both on the Mac and my wife's PC. Keep in mind that this is the hard drive that contained several hundred photos (and songs) that my wife really wanted. So, with the inexperience of a 5th grader, I slapped the drive on my desk, plugged it into the Mac and was on my way. 

I recall a modal dialog that was severed up to me. Something about the drive not formatted for that Mac and that it wanted to reformat it. I heard that it was easy to partition drives on the Mac so that's what I did. Half for the Mac half for the PC. I setup time machine and it worked flawlessly. 

Once I had the Mac backed up, I went over to back up the wife's computer and hooked up the hard drive. I decided to check on those files just to make sure they were safe. Nope... Something went horrible wrong. When I formatted the drive, it seems like it formatted the entire drive to be Mac friendly, then partitioned out a windows area. The panic ensued! 

I immediately went into damage control mode. How do I recover the files? I searched and searched until Google called and asked me to stop hogging their bandwidth. I've tried program after program but I cant get these files back. The strange thing is that the files are there.Each utility can locate the files but they can't read them. Were they corrupted?. I'm screwed! 

What I have now is a paper weight. I don't want to use the drive anymore because these precious files are on it. I'm in denial that they are unrecoverable because I haven't taken it to a professional yet for an opinion. 

The good news from this experience is that I've become much more data conscious.

##The solution... 

I just purchased an [HP EX487 MediaSmart Home Server](http://tinyurl.com/d7buy5). It's a 1.5 TB backup solution for the house. It also centralizes all types of media content that can be shared from anywhere with an internet connection. I really like the iTunes centralization so that my wife and I can hook up our computers to one library. It also offers integration with Flickr for my photos. I fully intend to load my pics on the mac, edit until my hearts content, move the data to the server and have it automatically load my pictures on flickr.

I've got the Mac doing monthly/weekly/daily/hourly backups with time machine both on a dedicated hard drive, and the Windows Home Server. 

So, in addition to a backup solution for both my mac and pc's, I now have a file sharing server which means I can load all my HD video (I have about 100 GB on my mac right now), audio files and other crap onto this server and keep it off of my machines. You can call Flickr my redundant backup solution for photos. I don't like clutter and I hate slowness and I hope to really clean things up. With my new 20 MPS internet connection I suspect that the backups and file sharing will be very fluid. Did I mention this thing has dual 750 GB 7200 RPM drives? 

I also have a separate 1 TB drive that I will use to backup the server. I'm currently investigating online storage that is cheap and integrates seamlessly with the home server so that I'm completely covered for any disasters at the house. 

** Update ** 

I do like my backup plan. It seems strong and reliable. At least I thought it was until I heard what Jeff Atwood and Phil Haack went through with their blogs. This scares me on many levels. Not only am I concerned about my photos on Flickr, but also blog posts and some social networking content (such as family events I’ve scheduled on Facebook). I have one particular blog entry [about my son](http://azcoov.blogspot.com/2008/03/our-son-liam-was-born-with-very-mild.html) that I treasure. The Windows Home Server has been rock solid but it doesn’t store everything I want and its a machine and thus is prone to failure.

I started out focusing on backing up my blog content. I wrote a program a while back that scrapes my atom feeds, then parses the xml and stores the content in a SQL database. In fact, I use this very same program to backup friends blog content and even some corporate businesses content. It works perfectly well with Atom and is extensible. The problem is that I don’t control the backup of my SQL database; my hosting company M6.net does.

I looked for another utility and found this open source gem called [Blogger Backup](http://www.codeplex.com/bloggerbackup). It’s using the GData C# library and allows you to authenticate with your Blogger account to pull down all content and save the data as xml. I took advantage of this, copied all my entries into a dropbox folder and replicated it to my Windows Home Server. Now I’m covered right?

I wasn’t satisfied. I don’t want to manage backups, especially if I have to manage different content in different ways. I want a utility that will back everything up regardless of what the content is.

I stumbled upon this website called backupify. Its a cloud based storage solution for almost any content. It uses Amazon Web Services and connects to nearly all social platforms, with your credentials and authorization, and stores your data in the cloud. Best of all, they are providing the service free for life until January 31st. Here’s how it works.

Finally, I can sleep at night. This has a huge [WAF](http://en.wikipedia.org/wiki/Wife_acceptance_factor) by the way…