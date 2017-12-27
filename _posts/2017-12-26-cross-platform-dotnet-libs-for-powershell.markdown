---
layout: post
title: "Cross Platform Dotnet Libs for Powershell"
date: 2017-12-26T19:41:00-08:00
---

Let’s say you want to use some dotnet dll in your powershell module. Wouldn't it be nice if you can just compile it once and then use on both Windows PowerShell (3.0 - 5.1) and core PowerShell (aka pwsh)? The good news is that YES, you can do it, mostly.

I found myself in this exact situation, while trying to make [platyPS](https://github.com/PowerShell/platyPS) cross platform. PlatyPS has two parts: dotnet library that does heavy lifting, and powershell module that uses it and provides all the nice UX build on top of this library. The powershell module part works great on powershell 6 as is. So the question was really about the C# compiled part. Can I just publish one assembly and avoid any runtime resolution logic?

Here is the most reasonable way to achieve it

1. Use `TargetFramework` `net451` (or some other `net4xx` of your choice)
2. Compile and ship this dll for full clr from a windows machine (since you cannot do that from linux or mac).
3. It will work just fine on powershell 6 on linux and mac. It definitely would not if you are using some non-existing APIs like Registry or Win Forms, but I haven’t seen a case, where it failed just because it could not properly map APIs between dotnet versions. Dotnet team actually did a very good job with dotnet core 2.0, greatly reducing traction for porting and adoption.
4. To allow developers do development on non-windows platform, you specify another `TargetFramework` `netstandard1.6` and build for this target only.
5. The only thing that I don’t personally like is the fact that you cannot make a publishable build from non-windows machine: the `net451` works fine on dotnet core, but the `netstandard1.6` fails on full.

One thing that simplified this process for me was the fact that platyPS dll doesn’t reference System.Management.Automation or any other powershell assemblies. If you need to reference them (i.e. for C# module), you should check [PSReadLine](https://github.com/lzybkr/PSReadLine) repo for a good example of how to achieve the same.

So here we go: use windows build for publishing and user non-windows build for development only. It could be even better, but that is already pretty good. It was a long journey to get there and many people from Microsoft and community dedicated many many hours of their life to make that happen. Kudos to all of them and big thanks for all the hard work!

PS: I just published platyPS 0.9.0 from my macbook! The module was downloaded from appveyor CI. This is a huge step forward for me since I don’t have access to any windows machine on a daily basis and I would need to create a VM just to publish the module few months ago.

