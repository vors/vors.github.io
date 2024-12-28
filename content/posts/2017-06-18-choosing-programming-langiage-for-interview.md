---
layout: post
title: "Choosing Programming Language For Interview"
date: 2017-06-18
---

I did a round of interviews in different companies for Software Engineer position in the end of 2016 and though it's a good idea to share my experience.
I also started interview people at Dropbox and got some additional perspective on the process.
There are a lot of different aspects of the interview.
One of the main skills evaluated on them is a coding questions solving.

There are different opinions about legitimacy is of this process.
We will leave this discussion out of the scope of this post.
The reality is that all companies are doing it.
So if you are looking for a developer position, you would need to solve such questions as efficiently as you can.
We will focus on choosing the programming language you are going to use.

## Coding questions

The coding part of the question generally takes 3 different forms depending on the company:

1. coding on a whiteboard (~ 60%)
2. coding in an online text editor, no IDE features (~ 10%)
3. coding in your prefered environment (~ 30%)

The percentage is based on my experience in 2016 only but I think they represent the trend.

The online text editor is very common for screening interviews (before you go to the onsite).
Screening interviews are in general much easier, so I didn't include them into this statistics.

## Choosing the language

There is a common place about choosing the language

- Use the language you are most comfortable with.
- If the decision is close, use the language your interviewer is most comfortable with.

I personally would prefer to walk to the interview with a clear understanding of what I'm going to use.
It removes unnecessary decision making from the interview.

Ok, so what languages did I know and could use?
The list was pretty boring:

- Java
- C
- C++
- C#
- Python
- PowerShell

If you count pet projects, school project and one-time offs, I can throw JavaScript to the mix.
My thoughts on them:

- [Boo C++](http://yosefk.com/c++fqa/index.html)
- C doesn't have good standard collections, no-go for interviews
- Java is OMG, SOOO VERBOSE. To be fair, it may get better nowadays with Java 8 and 9, but I didn't pay close attention to it.
- Python is cool, but I haven't use it in 3 years and didn't use it in any big project at all.
- C# is a good, less verbose than Java. I know it in and out, I was in Microsoft for the past 4 years.

So I decided to go with C#.

## Talking with HRs

Programmers who are doing interviews are generally don't care about what language you are using.
This rule applies to 95% people from my experience.
Some interviewers would be fine if you just do pseudo-code for the most part.

Who cares about languages are HRs.
They are trying to setup the interview loop in a way that everybody speaks your language.
So I spoke with HRs about programming languages, which sometimes may be amusing.

In one place I've been told that people who are using C# for interviews
are performing worse on average than people who are using other language.
That's quite a statement!
It may be a stretch, but for me it seems somewhat close to ["Mike’s a .NET dev, and we don’t like people with Windows experience"](http://danluu.com/programmer-moneyball/).
I already did a phone interview with them using C# and made a good connection with the engineer, who interviewed me.
I asked his opinion about using C# for the onsite and he was totally positive that it would not be a problem.
So I sticked with my choice.

Then there was one company that explicitly asked to use something other than C# for one interview.
That made me think again about alternative languages and I decided to brush up my python.
I used Cracking the Coding Interview Challenges on hackerrank.
I got my hands on python and realised how much I like it in the interview context.

## Why Python

Ok, so let's compare C# and Python from the interview prospective.

**Task**: fill up a dictionary that maps words from input into something.
To be more concrete let's say it counts how many times the word appear.
You know, the classic [map-reduce-Hello-World](https://hadoop.apache.org/docs/r1.2.1/mapred_tutorial.html#Example%3A+WordCount+v1.0).

This is one of the stepping stones in programs.
I had to code something along this lines in 30% of all interviews.

**C#**

    var d = new Dictionary<string, int>();
    foreach (var word in text.Split()) {
        int count;
        if (!d.TryGet(word, out count)) {
            count = 0;
        }
    
        d[word] = count + 1;
    }

**Python**

    d = {}
    for word in text.split():
        d[word] = d.get(word, 0) + 1

If you exclude tabulation, it's 154 chars vs 61 chars.
When you write code on the whiteboard (60% of all interviews as we said),
you appreciate every single saved char.
This is the most obvious benefit.

There is a number of subtle things that contribute to the easier whiteboard writing.

### No curly brackets

It's very natural to put curly brackets in pairs, when you are typing on a keyboard.
Your favorite text editor / IDE probably does it for you.
It's hard to break this habit, when you are coding on a white-board.
Maybe it's just me, but for me it leads to two outcomes

- trying to guess how much space do I need for this `while`-loop
- forget to close the open curly

### No round brackets

Let's say you need to write something like `foreach (var word in text.Split())`.
These two extra breakers may not seem like much, but it's wasted writing.

They also make code harder to read and write.
My `l`, `i`, `(` and `)` **all look alike on whiteboard**.
The less vertical lines I can put consequently the better.

### Collection
Python has great built-in collections: `dict` and `list`.
You can use `list` for

- array
- list
- queue
- stack

`dict` has the most whiteboard-friendly API to check that key is present in the collection:

**Python**

    if key not in d:

Look how clean it is! And no brackets!
Compare it to

**C#**

    if (!d.Contains(key)) {

See all this vertical lines that look alike?

Other popular collections are `set` and `OrderedSet`.
They come handy on interviews and usable with very slim syntax as well.


### Easy to change return type

When you need to return one more thing from a helper subroutine, python got your back.
Let's take a look at an example.
You wrote this code.

**Python**

    def foo():
        # code-code-code
        return count
    
    count = foo()

Just to realise that you need to return not only the `count`, but say `max` element as well.

**Python**

    def foo():
        # code-code-code
        return count, max
    
    count, max = foo()

Simple to fix on a whiteboard!
Now think about C# or Java.
You have to change

- signature of the method. You can go with `out parameter` or `Tuple<int, int>` for the return type.
- return statement
- caller code

All these changes a way more destructive to the code and it's hard to squeeze them without rewriting lines.

## Python problems

It's not all roses and rainbows.
The biggest problem for me is indentation.
I know that I just said that "No curlies" is a plus, but it comes with a price.
If you screw-up indentation (need to reindent a big block of text), it could become messy.

One thing I found useful was to start with big indentations.
That way there is a room to make them smaller if needed.

Sometimes it's just easier to rewrite a block of program.
And in this case you will appreciate the expressiveness of the language one more time.

## Conclusion

The language that you are picking should not be something obscure (Erlang), something verbose (Java), something that require memory management (C++).
Otherwise you will **spend time inefficiently**.
You will write boilerplate, you will fix memory leaks, you will explaining the syntax of the language to the interviewer.

Interviewers are **not** interested in dealing with language nuances,
they want to see that you can solve the problem **and** code it down.
In this situation faster is always better.
