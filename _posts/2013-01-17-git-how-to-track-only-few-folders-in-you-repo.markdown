---
layout: post
title: "Track only few folders in your git repo"
date: 2013-01-17 21:02
comments: true
categories: [git, gitignore, challenge]
---

Today I faced problems when tried to write a `.gitignore` file.

### Motivation 
We have a large project (300k files, 20Gb of source).
My team uses a centralized version control system.
Sometimes it's not handy, so I want to use **git** to manage my local changes.
The whole repository is too big. It takes about 30 seconds on a good machine to make a simple commit or to switch branches.
I work only on a subset of files, so it's reasonable to write **.gitignore** to keep track only of several subdirectories, right?

### Goal
Write .gitignore, that **ignores all files except** a directory named `source/good` (with subdirectories and subfiles).
`source/good` can contain arbitrary depth files in dirs hierarchy.

### Check your solution 
I have written [two simple scripts](/bin/task.zip) (will work only on unix with installed git).

1.  `unzip task.zip` in **empty** directory (scripts will remove `.git/` directory).
1.  `sh create.sh`.
1.  create and write a proper `.gitignore` in the root directory.
1.  `sh test.sh`. It will tell you the result.
