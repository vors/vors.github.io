---
layout: post
title: "Jump-Location 0.6.0 release candidate"
date: 2014-09-24 23:42:15 -0700
comments: true
categories: [open source, powershell, j]
---

Please, try out [Jump-Location 0.6.0 release candidat](/bin/Jump-Location-0.6.0-RC-3.zip).
The official release will happen later this week.

<!-- more -->

### Install instruction
If you don't have `Jump-Location`, please read [instruction](https://github.com/tkellogg/Jump-Location#installation), targeting this [archive](/bin/Jump-Location-0.6.0-RC-3.zip).

If you are already using `Jump-Location`, you can replace binaries in `(Get-Module Jump.Location).Path` folder, or start powershell session with `-NoProfile` option and import the new version of module.

`Start-Process powershell -ArgumentList '-NoProfile -NoExit -Command "Import-Module <path-to-release-candidate>\Jump.Location.psd1"'`

### Release notes
We have a lot of good stuff for you!

 1. `jumpstat` now has `-cleanup` parameter.
 1. Fix for [Issue with space in folder names](https://github.com/tkellogg/Jump-Location/issues/18)
 1. `jumpstat` now has `-scan` parameter.
 1. Fix problem that cause powershell [slows down 5 times](https://github.com/tkellogg/Jump-Location/issues/17) when the module is using.
 1. [Rename](https://github.com/tkellogg/Jump-Location/issues/16) cmdlet from 'Jump-Location' to 'Set-JumpLocation'.
 1. `Set-JumpLocation` now use `Push-Location` by default, and `j -` as a `popd` alias.
 1. Other bug fixes.
