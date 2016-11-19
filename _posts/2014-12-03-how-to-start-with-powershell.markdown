---
layout: post
title: "How to start with PowerShell"
date: 2014-12-03 01:04:21 -0800
categories: [powershell, ise, j]
---

*For windows developers, who miss bash*. 

Every time I tried explain my friends why they should use PowerShell, I didn't have a good demo.
Time to fix it!

Here is my **collection of show-cases** for awesome PowerShell features (with **.gif demos**!). 
It's also a very brief **introduction to PowerShell**. 

All demos recorded from **powershell_ise.exe** (PowerShell Intergrated Scripting Environment). 
It's a full-functional terminal with some IDE bells and wistles.
I recommend you to start exploring PowerShell from ise.

**Disclamer:** I work in Windows PowerShell team. This post is my personal opinion and doesn't represent my employer position.

<!-- more -->

## Use familiar unix-like aliases

They are mostly work as you expect!

`ls` is an alias for command `Get-ChildItem`.

![ls](/images/ps-demo/ls.gif)

`man` is an alias for command `Get-Help`.

![man](/images/ps-demo/man.gif)

`cat` is an alias for command `Get-Content`.

![cat](/images/ps-demo/cat.gif)

`kill` is an alias for command `Stop-Process`.

![kill](/images/ps-demo/kill.gif)



## Use intellisense in powershell_ise

Documentation (`man`) is a good thing, but you can do things much faster with **intellisense**. 
To bring intellisense use `Ctrl + Space`.

Beneficial if you understand basics of [PowerShell **naming conventions**](http://msdn.microsoft.com/en-us/library/ms714428%28v=vs.85%29.aspx). 
These conventions tremendously increase explorability. They are enforced by Microsoft and community for a good reason.
Main convention: all commands names are verb-noun pairs.

### Explore available commands

Use intellisense to explore and pick an appropriate command. 
In this examle, I looked for a command to manage `bitlocker` (disk encryption on windows).

Then I used intellisense to explore and specify command parameters.

![Explore available commands](/images/ps-demo/explore-bitlocker.gif)

### Explore available methods and properties in the pipeline

[Pipeline](http://technet.microsoft.com/en-us/library/dd347728.aspx) is one of the most awesome things in PowerShell. 
The basic idea: you **pass objects** (in fact .NET objects), **not text streams**. 
Then you can call methods and properties on objects passed in the pipeline. 
PowerShell can figure out a returned type of a command and use it to provide intellisense below in the pipeline.

![Explore available methods and properties in the pipeline](/images/ps-demo/explore-get-process-pipeline.gif)

`$_` variable represents current object. 
See `man about_Automatic_Variables` for details. 

### Explore environment variables

Explore, get and set env variables from PowerShell.

![Explore environment variables](/images/ps-demo/explore-env.gif)

## Jump-Location

[Install Jump-Location](https://github.com/tkellogg/Jump-Location) (autojump for PS) and navigate faster on the file-system. 
Seriously, I don’t understand how I lived without it.

![Jump-Location](/images/ps-demo/j.gif)


## Do .NET calls directly from PowerShell

PowerShell use .NET (CLR and DLR) and well-integrated with it.

Here is a quick demo for a bug in System.Type.GetType(String), that I explored recently.
``System.Type.GetType("System.Func`10")`` must return a generic type ``Func`10``, but it returns `null`. 

![GetType](/images/ps-demo/GetType.gif)

Look how simple you can call .NET APIs! 
Again, you have intellisense for them. 
More importent, there is no need to compile anything or create a project to test it out. 
It’s like a REPL for C#.

## Conclusion

If you are a windows developer (especially .NET developer), PowerShell should be in your tool arsenal.
It's a rich terminal and scripting language, highly inspired by unix terminals like bash and zsh.
