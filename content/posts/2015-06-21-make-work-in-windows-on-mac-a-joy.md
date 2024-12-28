---
layout: post
title: "Make work in Windows on Mac a joy"
date: 2015-06-21
---

Preambula
----------------------

My old MacBook Air pass out, so I got a new [MacBook](https://www.apple.com/macbook/) a week ago.
I never feel need in virtualization to play games or do something else on my old MacBook.
I had my transparent **terminal** to play with new cool stuff, my chrome **browser** with smooth two-finger scroll, 
**iMovie** to ocasionally make clips and that was about everything I ever used.

Since I work almost 3 years at Microsoft, I acquired some taste for Windows systems.
And when [Bruce](https://twitter.com/BrucePayette) asked me when I'm going to run **PowerShell** on my new laptop, 
I thought it would be cool to install **Windows 10 preview** as a second system.
I had no idea what is [bootcamp](http://www.apple.com/support/bootcamp/) and even was not sure is it possible to have two systems on Apple's hardware.
Advantures time!

**Disclamer**: I was not able to install Windows 10. 
I know that [it's possible](http://www.pcworld.com/article/2824227/how-to-install-the-windows-10-technical-preview-on-a-mac.html).
I cannot figure out how to install bootcamp drivers for trackpad and keyboard for **installation stage**.
I cannot go further then language select screen. Instead, I run Windows 8.1 now.

I don't have any disire to describe this somwhat straigforward process of bootcamp installation.
It still requires a lot of googling and retries, but there is nothing interesting about it.

What is interesting is the fact that once I start playing around with Windows 8.1 on Mac hardware 
(by hardware I primerely mean keyboard and trackpad as well as retina display),
I quickly reilize that it's **ass**.

Don't get me wrong: I actually like Windows 8.1 (and Windows 10 preview looks even better, except stability).
But it just feels soooo wrooong on MacBook. 
Keyboard shortcuts, trackpad momentum, brighness control. 
**Nothing just work** as expected. 
That's why I defined an **Uber Goal**: make Windows expirience as close to OS X as possible.

My receipe to make Windows on Mac a joy
----------------------

Short cuts
===============

**Goal**: rebind keyboard to use standart Mac shortcuts.

After installing Windows on Mac via bootcamp, _**Command**_ ("&#8984;") key becomes _**Win**_ key.
It totally makes sense ... for somebody who never work on Mac.
Most essential Mac short cuts (copy / paste, close program, change keyboard layout) use "&#8984;".

First requirement: **rebind _Win_ key to _Left Ctrl_ key**.

It's possible to do with `HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout\ScancodeMap` registry key. 

![Registry entry for ScancodeMap](/images/WindowsOnMac/RegistryScancodeMap.png)

The date format is somewhat straighforward, but it's binary and uses keys hex identifiers. 
It's much easier to use [SharpKeys](https://github.com/randyrants/sharpkeys) utility to do math and edit registry for you.

I recommend **swap** _Left Ctrl_ and _Win_ key (add the second entry), because _Win_ is part of some useful short cuts itself.
It also bring start screen and I use it all the time for applications quick lunch. 

![SharpKeys binding](/images/WindowsOnMac/SharpKeysBinding.png)

We are already in a pretty good shape: 

-   "&#8984;" `C` / "&#8984;" `V` (copy / paste).
-   "&#8984;" `1` / "&#8984;" `2` / "&#8984;" `3` (to select tab in a browser).
-   "&#8984;" `W` (to close tab).

already work as expected.    

Better short cuts
===============

One thing that I found extremely annoying is `Alt` `Tab`.
I want it to be the same as OS X: "&#8984;" `Tab`.
But I cannot achive it with the same registry trick: it would conflict with my existing binding.
We need a way to rebind **combinations**.

I found the solution in [AutoHotKey](https://www.autohotkey.com/).
I was particularly interested to try it out, since one of their tag-lines is "Fast scriptable desktop automation with hotkeys" (khm khm PowerShell).

It's also an [open source project](https://github.com/AutoHotkey/AutoHotkey) with GPL license and [community](https://github.com/ahkscript),
pretty [modern-looking website](https://www.autohotkey.com/),
[sublime-text plugin](https://github.com/ahkscript/SublimeAutoHotkey),
[solid documentation](https://www.autohotkey.com/docs/v1/Hotkeys.htm);
it doesn't bag for donations (in fact there is no option for donate as far as I know).
Not your archetypal [Windows ecosystem helper application](http://trackpad.powerplan7.com/).

I wrote this simple `.ahk` script to remap `Alt` `Tab` and `Alt` `F4`

	; 'Command' remapped to 'Left Control' in Registry
	; https://sharpkeys.codeplex.com/
	
	; Remap 'Command' + 'Tab' to be 'Alt' + 'Tab'
	; this line require 'Run with UI Access': 
	; https://www.autohotkey.com/board/topic/70449-enable-interaction-with-administrative-programs/
	LControl & Tab::AltTab 
	
	; Remap 'Command' + 'Q' to 'Alt' + 'F4'
	LControl & q::Send !{f4}
	
	; Remap 'Command' + 'Space' to 'Win' + 'Space' 
	; Change language layout in Win 10
	LControl & Space::Send #{Space}

It turns out that to rebind `Alt` `Tab` on Windows 8.1 you need [a little bit more ceremony](https://www.autohotkey.com/board/topic/70449-enable-interaction-with-administrative-programs/).
Once you done with _patching AutoHotKey.exe with AutoHotKey.exe_, 
you can create a `.lnk` file in your `~\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup` directory to automatically run script on the system startup.

**UPD:** Use `C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp` directory to enable it for all users. 

On my system "Target" is `"C:\Program Files\AutoHotkey\AutoHotkey.exe" C:\dev\AutoHotkey\WindowsOnMac.ahk`

![AutoHotkey lnk property](/images/WindowsOnMac/AutoHotKeyLnk.png)

**Voilà!** Feel free to customize more key combinations. 

**UPD:** I created [the repo](https://github.com/vors/AutoHotKey-Mac) with all code related to AutoHotKey setup.

Brightness
===============

Windows auto-adjustive brightness doesn't play nicely with manual brightness adjustion.
It makes everything look pretty **dim**.
Just **[turn auto-brightness off](https://discussions.apple.com/thread/4073073?tstart=0)**.

Better trackpad
===============

It's a little bit painful to install [TrackPad++](http://trackpad.powerplan7.com/) (especially read Web-1.0-site), 
but it adds **innertial movement** to trackpad two-finger scroll. 
So I cosider it worth mentioning.
Just be awere that it doesn't fully work in Google chrome (only Firefox and IE 11), which is Google's fault.
I found that IE 11 with TrackPad++ provides pretty good scrolling expirience. Not as good as native Apple's Safari, but a decient one.

**Update:**
I take back my recomendation for **TrackPad++**.
It's cumbersome, annoying and doesn't provide much value.
All you really need is a way to [**reverse trackpad scrolling direction**](http://superuser.com/questions/310681/inverting-direction-of-mouse-scroll-wheel)

    Get-ItemProperty HKLM:\SYSTEM\CurrentControlSet\Enum\HID\*\*\Device` Parameters FlipFlopWheel -EA 0 | ForEach-Object { Set-ItemProperty $_.PSPath FlipFlopWheel 1 }

Conclusion
---------------------

Know your tools and make your work **enjoyable**.

