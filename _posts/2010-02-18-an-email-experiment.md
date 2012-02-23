---
layout: post
title: "An Email Experiment"
excerpt:
  For two years now I've been studying David Allen’s Getting Things Done method for productivity. I’ve tried out various tools from a GTD Outlook plugin, to Remember The Milk (RTM), to my own custom To-Do list application. So far, with my current setup of RTM as my inbox and next actions, and Evernote as my digital file locker, I’ve been able to stay ahead of the game in nearly every aspect of my life except work email.
---

For two years now I've been studying David Allen’s Getting Things Done method for productivity. I’ve tried out various tools from a GTD Outlook plugin, to Remember The Milk (RTM), to my own custom To-Do list application.

So far, with my current setup of RTM as my inbox and next actions, and Evernote as my digital file locker, I’ve been able to stay ahead of the game in nearly every aspect of my life except work email.

I’ve never liked email. As a software programmer, I like to collaborate in groups and have conversations face-to-face or on the phone. Not everyone understands email etiquette (people who send emails with an empty subject should stop reading now) and its far too easy for people to be dropped from a conversation thread. Also, as emails get longer, and the conversation morphs into multiple conversations, its nearly impossible to follow everything that is going on. Oh and the spam. Don’t get me started on the spam. I consider spam to be anything not directly related to the projects I’m working on. For example “We are cleaning out the refrigerator today at noon” is spam in my inbox.

The struggle I have is filtering out the stuff I don’t want to see, quickly deleting the items that are not important, and filing the stuff that is important. Also, the email notifications that pop-up have been distracting me for years and I never did anything about it. I starting asking myself why I have an email notification? I’m not required to read and respond to every single email that pops into my inbox, and it certainly is a productivity killer to get a pop-up when your deep in thought and writing code.

Picture yourself deep in thought about the code you are writing. Your about to call an authentication method that you know is important and as you are calling this method you get an email notification. My brain, even if only for a second, will focus on that email and not the important code I'm writing.

<a title="Distracting Email by CoovTech, on Flickr" href="http://www.flickr.com/photos/coovtech/4368973487/" _mce_href="http://www.flickr.com/photos/coovtech/4368973487/"><img src="http://farm3.static.flickr.com/2702/4368973487_8de36384be_o.png" _mce_src="http://farm3.static.flickr.com/2702/4368973487_8de36384be_o.png" alt="Distracting Email" width="725" height="202"></a>

This may seem silly but you have to think about this in the context of your work day. I get many emails and for some strange reason their timing is always bad. Multiply this distraction a few times over and you’ll realize that its a productivity killer. I think its time to fix this problem. After all, being productive IS my job.

Here is my experiment:

- I will start with zero emails. the initial setup of this will take about a day.
- I will turn of all email notifications. This includes the outlook pop-up, the email icon in the task bar, and the annoying beep.
- I will reverse the email order in my inbox so that I always look at the old email first. This is so that when I check my email, I won’t miss any important conversation threads. This is also critical for step 4.
- I will only check my email at set intervals. It may be every two hours, or three times a day. I haven’t decided. I was thinking about a slow transition at first, maybe hourly checks, but I really don’t want to be that involved with my inbox.
- Write an Outlook VBA macro that makes categorizing and filing my email easier.

I’ve already written the code for the button. It’s straight forward. I want to get a handle on the currently selected item in my inbox. Then I want to launch the Categories dialog so that I can add categories (tags) to the email. Then I want it to mark the email as read and file it away in my “File” folder (This is my only folder by the way as I use tags for everything).

        Sub FileItem()
        Dim Item As MailItem
        Set Item = Outlook.Application.ActiveExplorer.Selection.Item(1)
        Item.ShowCategoriesDialog
        If Not Item.Categories = "" Then
            Item.UnRead = False
            Set dstFolder = GetFolder("Mailbox - ME\File")
            Item.Move dstFolder
        End If
        End Sub

        Public Function GetFolder(strFolderPath As String) As MAPIFolder
          Dim objApp As Outlook.Application
          Dim objNS As Outlook.NameSpace
          Dim colFolders As Outlook.Folders
          Dim objFolder As Outlook.MAPIFolder
          Dim arrFolders() As String
          Dim I As Long
          On Error Resume Next

          strFolderPath = Replace(strFolderPath, "/", "\")
          arrFolders() = Split(strFolderPath, "\")
          Set objApp = CreateObject("Outlook.Application")
          Set objNS = objApp.GetNamespace("MAPI")
          Set objFolder = objNS.Folders.Item(arrFolders(0))
          If Not objFolder Is Nothing Then
            For I = 1 To UBound(arrFolders)
              Set colFolders = objFolder.Folders
              Set objFolder = Nothing
              Set objFolder = colFolders.Item(arrFolders(I))
              If objFolder Is Nothing Then
                Exit For
              End If
            Next
          End If
          Set GetFolder = objFolder
          Set colFolders = Nothing
          Set objNS = Nothing
          Set objApp = Nothing
        End Function

My plan is to expand on this “easy button” and add an additional option that will copy the email and fire it off to RTM as a Next Action. I’m hoping that by relying on RTM exclusively for Next Actions, it will make it easier to manage all the projects and tasks I’m working on.

So, as I plan for this experiment to fail, I honestly believe that the worst thing that may happen is someone gets upset because I don’t respond to an email immediately. And to that I ask… If I have to respond to an email immediately, then why do I have a phone, and instant messaging? Is email really the best place to communicate emergencies? I’m sure people will disagree with me, and that’s ok.

As I plan for success, I imagine less stress and more time to focus on my job, which is to deliver great software. In a perfect world, this would free up so much time that I’ll get spend more time coding on non-work projects for fun with my wife and kids :)

Time will tell and I’ll report back with results.