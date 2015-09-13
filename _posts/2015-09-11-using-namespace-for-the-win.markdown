---
layout: post
title: "using namespace For The Win"
date: 2015-09-11 00:00:00 -0700
comments: true
categories: [powershell, dsc]
---

PowerShell works pretty smooth with .NET from day 1, but calling .NET APIs was pretty [verbose](http://serverfault.com/questions/74744/using-namespaces-in-powershell) excercise.

Let's try to call some .NET API via reflection.
**Note:** 
`System.String` is generally imutable in .NET:
when you call `'abc'.Substring(1)` it creates a new object to represent `bc` and so on.
You can modify strings with reflection.

**Note:** strings are immutable for a very good reason and you don't usually want to do that.
I peek this example for a purely issultrative reasons.

## Alternate string via reflection

If you want to call a private method, you are gettig `System.Reflection.RuntimeMethodInfo` or something similar, then you call `Invoke` and pass some parameters.

For

~~~powershell
[System.GC].GetMethod('_AddMemoryPressure', [System.Reflection.BindingFlags]::NonPublic -bor [System.Reflection.BindingFlags]::Static).Invoke($null, [uint64]1)
~~~

