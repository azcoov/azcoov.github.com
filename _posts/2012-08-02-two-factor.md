---
layout: post
title: "The Problem with Two-Factor Authentication"
excerpt:
  As an IT professional who is concerned with security, I like this model. It makes it much more difficult for unauthorized users to access the system/network/app, etc and that's what I want. As a user, I hate this model!
---

I was following along with John Sheehan's thoughts on [password-less authentication](http://john-sheehan.com/post/28437774039/is-it-time-for-password-less-login) and two-factor authentication came up today with a [post by TechCrunch](http://techcrunch.com/2012/08/02/y-combinator-backed-startup-authy-wants-to-help-you-prevent-a-dropbox-style-security-snafu/) about [Authy](https://www.authy.com/).

Two-Factor authentication is a great security model. There are various flavors of two-factor authentication but the Authy concept specifically relates to sending a short token to you via an Authy app, or SMS.

I use a two-factor authentication system every day for some contracting work I do. It's a combination of VPN and two-factor auth. When I want to connect to the remote network, I start by connecting VPN. I'm prompted with a required token. To get that token, I have to open an iPhone app which will render a new token. I manually type that token into the VPN token dialog, then I'm prompted for my password with another dialog. When I supply that, I'm authenticated!

##THIS SUCKS!!!
As an IT professional who is concerned with security, I like this model. It makes it much more difficult for unauthorized users to access the system/network/app, etc and that's what I want.

As a user, I hate this model. It's a bit of a pain in the ass to do this. What happens if I forgot my phone (it's rare, but it happens). What happens when the token system is down? What if I don't have a smart phone, or a cell phone (yeah, there are still a couple of people in the world that don't carry these things with them). I don't want to fumble around with multiple apps. I just want to sit down and work. The less hoops I have to jump through to start my day, the better.

The organization that I work with solved the mobile problem by also offering an installed cross-platform desktop token app, which is great, but it's not perfect.

You can interchange "email" with "app" and "sms" but there are still roadblocks with that. I work with some clients who do not allow any third-party apps at all. Some clients won't use email. I was joking with some friends the other day about two-factor auth with a client that is locked down so tight that we figured we'd have to physically call them with their token. Or snail-mail it to them :)

##Is There Something Better?
Not currently. I think what Authy is doing is great. Especially if your app's target audience is technically savvy and/or understands the importance of security.

I hate to say this but we need a way to force our high security standards on our users without annoying them. As an industry we are moving in the right direction but we need to continue to improve it.