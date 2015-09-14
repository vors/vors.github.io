---
layout: post
title: "using namespace For The Win"
date: 2015-09-11 00:00:00 -0700
comments: true
categories: [powershell, dsc]
---

PowerShell works pretty smooth with .NET from day 1. Calling .NET APIs was pretty [verbose](http://serverfault.com/questions/74744/using-namespaces-in-powershell) excercise.

To show that let's try to call some .NET reflection API.

## Alternate string via reflection

`System.String` is generally imutable in .NET:
when you call `'abc'.Substring(1)` it creates a new object to represent `bc` and so on.
You can modify strings with reflection.

**Note:** strings are immutable for a very good reason and you don't usually want to do that.
I peek this example just to illustrate the technic.

This code creates `System.String` object and change it's length to access some random bytes from the heap.

**Note:** be careful, it can crash PowerShell process.

~~~powershell
$s = 'abc'
$handle = [string].GetField('m_stringLength', [System.Reflection.BindingFlags]::NonPublic -bor [System.Reflection.BindingFlags]::Instance)
$handle.SetValue($s, 20)
$s
# Output:
# abc       櫠奙翹 洘 
~~~

This repeating `System.Reflection.BindingFlags` is quite verbose.

## Write it shorter with `using namespace`

~~~powershell
using namespace System.Reflection
$s = 'abc'
$handle = [string].GetField('m_stringLength', [BindingFlags]::NonPublic -bor [BindingFlags]::Instance)
$handle.SetValue($s, 20)
$s
~~~
