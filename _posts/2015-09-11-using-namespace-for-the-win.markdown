---
layout: post
title: "using namespace For The Win"
date: 2015-09-11 00:00:00 -0700
comments: true
categories: [powershell, dsc]
---

PowerShell works pretty smooth with .NET from day 1, but calling .NET APIs was pretty [verbose](http://serverfault.com/questions/74744/using-namespaces-in-powershell) excercise.

Let's say you want to call
```
[System.GC].GetMethod('_AddMemoryPressure', [System.Reflection.BindingFlags]::NonPublic -bor [System.Reflection.BindingFlags]::Static).Invoke($null, [uint64]1)
```

