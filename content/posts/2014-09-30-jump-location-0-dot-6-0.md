---
layout: post
title: "Jump-Location 0.6.0"
date: 2014-09-30
categories: [open source, powershell, j]
---

[Jump-Location](https://github.com/tkellogg/Jump-Location) is an [autojump](https://github.com/joelthelion/autojump) for PowerShell.
We are happy to announce that **Jump-Location 0.6.0** is out!

### Release notes

 1. Fix problem that cause powershell [slows down 5 times](https://github.com/tkellogg/Jump-Location/issues/17) when the module is loaded.
 1. Fix for [Issue with space in folder names](https://github.com/tkellogg/Jump-Location/issues/18)
 1. `jumpstat -cleanup` removes obsolete (non-existing anymore) records from the database.
 1. `jumpstat -scan .` recursively adds directories from the current directory with 0 weight.
 1. Main cmdlet [renamed](https://github.com/tkellogg/Jump-Location/issues/16) from 'Jump-Location' to 'Set-JumpLocation'.
 1. Install from http://psget.net/
 1. `Set-JumpLocation` now use `Push-Location` by default, and you can use `j -` or `popd` to go back:
```
C:\foo> j bar
C:\bar> j -
C:\foo> 
``` 
 
<!-- More -->

### Install
Follow github installation [instruction](https://github.com/tkellogg/Jump-Location#installation).

### Upgrade
If you are already using Jump-Location, you can update your version with [the script](/bin/JumpUpgrade.ps1):
```
(new-object Net.WebClient).DownloadString("http://vors.github.io/bin/JumpUpgrade.ps1") | iex
```

### Credits

 1. [Scott Hanselman](https://github.com/shanselman), for a [blog post about Jump-Location](http://www.hanselman.com/blog/JumpLocationAChangeDirectoryCDPowerShellCommandThatReadsYourMind.aspx) and [opened github issues](https://github.com/tkellogg/Jump-Location/issues/created_by/shanselman).
 The interest created by his blog post is the reason for release 0.6.0.
 1. [Jason Shirk](https://github.com/lzybkr), for code reviews and feedback.
 1. [LCHarold](https://github.com/LCHarold), for `choco install Jump-Location`. 
 1. [Chris Bentivenga](https://github.com/chrisbenti) for PsGet `Install-Module Jump.Location`.
 1. [Contributors](https://github.com/tkellogg/Jump-Location/graphs/contributors) and [everybody who reported issues](https://github.com/tkellogg/Jump-Location/issues?q=is%3Aissue+).
