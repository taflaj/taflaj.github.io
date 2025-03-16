---
layout: post
title:  "Functional programming in Python"
categories: technology programming functional-programming python
date: 2024-05-15
last_modified_at: 2025-03-16
excerpt_separator: <!--more-->
---
![python](/assets/images/python.jpeg)
<div style="font-size: 0.8em; text-align: right">Image source: OpenAI</div>
In this article I'm presenting a way of using functional programming in Python, highlighting some benefits and a few shortfalls. There are plenty of scholars out there; this is mostly a hobbyist's perspective, so please don't consider this to be the ultimate word.
<!--more-->
## Declarative vs imperative programming

One difference between declarative and imperative programming is that, on the former, you tell the computer <mark>what</mark> to do, while on the latter you tell it <mark>how</mark> to do it. The examples below will give more clarity on this.

### Object oriented programming

OOP (for short) is one example of imperative programming. You model the data and behavior in classes and, on run time, the program instantiates classes into objects. A class can be viewed as the blueprint of the data you want to handle and how it should behave, while the objects are the data itself.

Four basic principles of OOP:[^1] 
- **Abstraction**: Modeling the relevant attributes and interactions of entities as classes to define an abstract representation of a system.
- **Encapsulation**: Hiding the internal state and functionality of an object and only allowing access through a public set of functions.
- **Inheritance**: Ability to create new abstractions based on existing abstractions.
- **Polymorphism**: Ability to implement inherited properties or methods in different ways across multiple abstractions.

[^1]: Source: [Microsoft: Object-Oriented programming (C#)](https://learn.microsoft.com/en-us/dotnet/csharp/fundamentals/tutorials/oop)

Even though Python does not fully implement all principles, <mark>everything</mark> in Python is an object. For example:
```python
>>> a=1
>>> type(a)
<class 'int'>
```
Which means, `a` is an instance of class `int`, therefore an object.

### Functional programming

FP (for short) is one example of declarative programming. These are a few principles:
- Pure functions
  - Functions must accept at least one argument
  - Functions return data or another function
  - No loops
  - Stateless (whenever the function runs, it's like it's running for the first time; in other words, given the same inputs, the output will always be the same)
  - No side effects (when the function runs, <mark>nothing</mark> outside of its scope will change)
- Immutable values
  - Scalar variables are constant
  - If a function needs, for example, to alter an array, then instead it should make an altered copy of the array and return it
- Referential transparency
  - An expression is called *referentially transparent* if it can be replaced with its corresponding value (and vice-versa) without changing the program's behavior. This requires that the expression be pure: its value must be the same for the same inputs and its evaluation must have no side effects. An expression that is not referentially transparent is called *referentially opaque*.[^2]

[^2]: Source: [Wikipedia: Referential transparency](https://en.wikipedia.org/wiki/Referential_transparency)

## Practical example \#1: factorials

This is one way of defining a function to calculate the factorial of a number using imperative programming:


```python
def factorial1(n: int) -> int:
    result = 1
    for i in range(2, n+1):
        result *= i
    return result
```

There are two side effects (`result` and `i`), both of which are mutable, and there is one `for` loop. Regardless, how does it perform?


```python
%%timeit
factorial1(1558)
```

    319 μs ± 14.3 μs per loop (mean ± std. dev. of 7 runs, 1,000 loops each)


Note: 1,558 is the largest input I could find that does not break the function.

Here's the same function, this time using functional programming principles:


```python
def factorial2(n: int) -> int:
    return 1 if n < 2 else n * factorial2(n-1)
```


```python
%%timeit
factorial2(1558)
```

    438 μs ± 21.4 μs per loop (mean ± std. dev. of 7 runs, 1,000 loops each)


It's roughly 25% slower.

Python allows us to define `lambda` functions, which also adhere to functional programming principles. Here's one way of writing the same function:


```python
factorial3 = lambda n: 1 if n < 2 else n * factorial3(n-1)
```


```python
%%timeit
factorial3(1558)
```

    416 μs ± 13.3 μs per loop (mean ± std. dev. of 7 runs, 1,000 loops each)


It's almost as fast as the previous example, and again much slower than using imperative programming. Also, we're not measuring resource usage here, although we do know that recursion does consume memory.

## Practical example \#2: the Fibonacci sequence

Here's a simple implementation using imperative programming:


```python
def fibonacci1(n: int) -> int:
    a, b = 0, 1
    for i in range(n):
        a, b = b, a + b
    return a
```

Likewise, there are three side effects (`a`, `b`, and `i`), all of which mutable, and one `for` loop.


```python
%%timeit
fibonacci1(20577)
```

    3.78 ms ± 153 μs per loop (mean ± std. dev. of 7 runs, 100 loops each)


Once again, 20,577 is that largest input I could find that does not break the function.

Let's try a purely functional approach to the Fibonacci sequence.


```python
fibonacci3 = lambda n: n if n < 2 else fibonacci3(n-1) + fibonacci3(n-2)
```

It becomes unbearably slow, as can be seen here (I tried a smaller number just to make it palatable).


```python
%%timeit -n 10
fibonacci3(30)
```

    82.5 ms ± 3.19 ms per loop (mean ± std. dev. of 7 runs, 10 loops each)


For the sake of comparison, here's the timing when using the purely imperative approach.


```python
%%timeit -n 1000
fibonacci1(30)
```

    702 ns ± 158 ns per loop (mean ± std. dev. of 7 runs, 1,000 loops each)


### A pinch of dynamic programming

The first problem with the Fibonacci sequence is that there are two recursions: `fibonacci3(n-1)` and `fibonacci3(n-2)`.

The other problem, maybe even worse, is that the function keeps recalculating the same value over and over again. As an example, what happens when we run `fibonacci3(30)`? It runs for 29, which runs for 28, 27, 26, etc. **and then** it runs for 28 **AGAIN**! Why can't we reuse what has been previously calculated?

In comes dynamic programming. One of its principles is to break down a problem into smaller subproblems and solve them on at a time, and then solve the bigger one. In this case, we can use it as an optimization over plain recursion. Wherever we see a recursive solution that has repeated calls for same inputs, we can optimize it using dynamic programming. The idea is to simply store the results of subproblems, so that we do not have to re-compute them when needed later. This simple optimization reduces time complexities from exponential to polynomial.[^3]

[^3]: Source: [GeeksforGeeks: Dynamic Programming](https://www.geeksforgeeks.org/dynamic-programming/#)

Here's one implementation:


```python
cache = {}
def fibonacci4(n: int) -> int:
    if n not in cache:
        cache[n] = n if n < 2 else fibonacci4(n-1) + fibonacci4(n-2)
    return cache[n]
```

Not only `cache` is mutable, but it's also a huge side effect, as it will linger forever. In Python, however, we could minimize the risk of another function to alter `cache` by placing it on an external file.

How does it perform? It's hard to determine the maximum amount at which it breaks, so I'll just use a number of my choice.


```python
%%timeit
fibonacci4(1000)
```

    43.7 ns ± 0.458 ns per loop (mean ± std. dev. of 7 runs, 10,000,000 loops each)


For the sake of comparison, once again I present you the timing when using the purely imperative approach.


```python
%%timeit
fibonacci1(1000)
```

    34.8 μs ± 417 ns per loop (mean ± std. dev. of 7 runs, 10,000 loops each)


The numbers speak for themselves: the dynamic programming examples runs in a fraction of the time used by other paradigms. This is because, most of the time, the function is just returning the value that had been previously calculated.

In case you were wondering, the cache is, indeed, preserved between runs.


```python
len(cache)
```




    1001



### Memoization

The technique we just used up here is called *memoization*. According to [Wikipedia](https://en.wikipedia.org/wiki/Memoization), "In computing, memoization or memoisation is an optimization technique used primarily to speed up computer programs by storing the results of expensive function calls to pure functions and returning the cached result when the same inputs occur again."

Fortunately for us, Python has plenty of rabbits we can hide in our hats. A [quick search online](https://duckduckgo.com/?q=memoization+python&t=newext&atb=v427-6&ia=web) will show us a number of possibilities, some built in, others we can build ourselves without having to recreate them over and over again.

I, for one, prefer to keep things simple. On average, those who preceded me have spent significant time building effective implementations of a comprehensive solution to a problem, and the best I can do is, at the least, evaluate their solution. Let's begin by having a look at `functools.lru_cache`:


```python
from functools import lru_cache

@lru_cache
def fibonacci2a(n : int) -> int:
    return n if n < 2 else fibonacci2a(n-1) + fibonacci2a(n-2)
```


```python
%%timeit
fibonacci2a(1000)
```

    40.6 ns ± 1.51 ns per loop (mean ± std. dev. of 7 runs, 10,000,000 loops each)


Another possibility is to use `functools.cache`. The difference is that `cache` doesn't enforce a limit whilst `lru_cache` does.


```python
from functools import cache

@cache
def fibonacci2b(n : int) -> int:
    return n if n < 2 else fibonacci2b(n-1) + fibonacci2b(n-2)
```


```python
%%timeit
fibonacci2b(1000)
```

    39.1 ns ± 0.547 ns per loop (mean ± std. dev. of 7 runs, 10,000,000 loops each)


The other difference is that `cache` could be faster than `lru_cache` because, among other reasons, it doesn't have to manage limits. Care must be taken, though, because resource consumption could increase significantly over time <mark>and it would be very hard to pinpoint the root cause</mark>.

By the way, did you notice that the examples using `cache` and `lru_cache` ran faster than my previous code caching intermediate results internally (fibonacci4)?

## The Golden Hammer antipattern

The Golden Hammer antipattern permeates from a development team's overreliance on a single tool set, pattern, platform, or other component of the development workflow. It is a classic pitfall that any team faces when they have gained some level of expertise in a particular solution or methodology. This antipattern is appropriately summarized using the following adage: "When all you have is a hammer, everything looks like a nail."[^4]

One of the main advantages of functional programming is its simplicity. Given the same results for the same inputs, and given there are no side effects, it's easy to debug. Resource consumption and execution time may be issues and must be taken into account. In my past experience as a software engineer, however, I should say that only in rare occasions I dealt with deep recursion levels. The most notable case was so many years ago, when I had to look up data in a hierarchical data structure. Resources were at a premium and my program was crashing at random intervals. My very talented data architect came to the rescue, creating a new database view for me, and my problems went away.

Or, at the least, that one.

There are purely declarative programming languages. Likewise, there are purely imperative programming languages. You *may* be stuck.

There are, nonetheless, multiparadigm programming languages. You'll have the option to choose how to write your code. Against the Golden Hammer antipattern, remember that you have multiple tools and techniques at your disposal, so do yourself a favor and choose the best one for solving the problem at hand.

[^4]: Source: [TechTarget: Signs of a Golden Hammer antipattern, and 5 ways to avoid it](https://www.techtarget.com/searchapparchitecture/tip/Signs-of-a-Golden-Hammer-antipattern-and-ways-to-avoid-it)

---

#### Revision history

1. 2024-05-15: Original posting date.
2. 2025-03-16: New hardware.

---
