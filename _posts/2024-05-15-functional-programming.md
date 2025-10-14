---
layout: post
title:  "Functional programming in Python"
categories: technology programming functional-programming python
date: 2024-05-15
last_modified_at: 2025-10-14
excerpt_separator: <!--more-->
---
[![python](/assets/images/python.jpeg)](/functional-programming/)
<div style="font-size: 0.8em; text-align: right">Image source: OpenAI</div>
In this article I'm presenting a way of using functional programming in Python, highlighting some benefits and a few shortfalls. There are plenty of scholars out there; this is mostly a hobbyist's perspective, so please don't consider this to be the ultimate word.
<!--more-->
## Declarative vs imperative programming

One difference between declarative and imperative programming is that, on the former, you tell the computer <mark>what</mark> to do, while on the latter you tell it <mark>how</mark> to do it. The examples below will give more clarity on this.

### Object oriented programming

OOP (for short) is one example of imperative programming. You model the data and behavior in classes and, during run time, the program instantiates classes into objects. A class can be viewed as the blueprint of the data you want to handle and how it should behave, while the objects contain the data itself.

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
  - An expression is called *referentially transparent* if it can be replaced with its corresponding value (and vice-versa) without changing the program's behavior. This requires that the expression be pure: its value must be the same for the same inputs and its evaluation must have no side effects.
    - An expression that is not referentially transparent is called *referentially opaque*.[^2]

[^2]: Source: [Wikipedia: Referential transparency](https://en.wikipedia.org/wiki/Referential_transparency)

Note: for reference, this is the Python version I'm using:


```python
import sys
sys.version
```




    '3.13.7 (main, Aug 15 2025, 12:34:02) [GCC 15.2.1 20250813]'



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

    423 μs ± 100 μs per loop (mean ± std. dev. of 7 runs, 1,000 loops each)


Notes:
1. Timings are empirical and non-deterministic.
2. 1,558 is the largest input I could find that does not break the function.

Here's the same function, this time using functional programming principles:


```python
def factorial2(n: int) -> int:
    return 1 if n < 2 else n * factorial2(n-1)
```


```python
%%timeit
factorial2(1558)
```

    476 μs ± 77.8 μs per loop (mean ± std. dev. of 7 runs, 1,000 loops each)


It's more than 25% slower.

Python allows us to define `lambda` functions, which also adhere to functional programming principles. Here's one way of writing the same function:


```python
factorial3 = lambda n: 1 if n < 2 else n * factorial3(n-1)
```


```python
%%timeit
factorial3(1558)
```

    386 μs ± 7.04 μs per loop (mean ± std. dev. of 7 runs, 1,000 loops each)


It's similar to the previous example, and again much slower than using imperative programming. Also, we're not measuring resource usage here, although it's known that recursion does consume memory.

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

    3.49 ms ± 52.6 μs per loop (mean ± std. dev. of 7 runs, 100 loops each)


Once again, 20,577 is the largest input I could find that does not break the function.

Let's try a purely functional approach to the Fibonacci sequence.


```python
fibonacci3 = lambda n: n if n < 2 else fibonacci3(n-1) + fibonacci3(n-2)
```

It becomes unbearably slow, as can be seen here (I tried a smaller number just to make it palatable).


```python
%%timeit -n 10
fibonacci3(30)
```

    72.7 ms ± 892 μs per loop (mean ± std. dev. of 7 runs, 10 loops each)


For the sake of comparison, here's the timing when using the purely imperative approach.


```python
%%timeit -n 1000
fibonacci1(30)
```

    771 ns ± 92 ns per loop (mean ± std. dev. of 7 runs, 1,000 loops each)


Much faster, indeed.

### A pinch of dynamic programming

The first problem with the Fibonacci sequence is that there are two recursions: `fibonacci3(n-1)` and `fibonacci3(n-2)`.

The other problem, maybe even worse, is that the function keeps recalculating the same value over and over again. As an example, what happens when we run `fibonacci3(30)`? It runs for 29, which runs for 28, 27, 26, etc. **and then** it runs for 28 **AGAIN**! Why can't we reuse what has been previously calculated?

In comes dynamic programming. One of its principles is to break down a problem into smaller subproblems and solve them on at a time, and then solve the bigger one. In this case, we can use it as an optimization over plain recursion. Wherever we see a recursive solution that has repeated calls for same inputs, we can optimize it using dynamic programming. The idea is to simply store the results of subproblems, so that we do not have to re-compute them when needed later. This simple optimization reduces time complexities from exponential to polynomial.[^3]

[^3]: Source: [GeeksforGeeks: Dynamic Programming](https://www.geeksforgeeks.org/dynamic-programming/#)

Here's one quick and dirty implementation:


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

    40.3 ns ± 0.611 ns per loop (mean ± std. dev. of 7 runs, 10,000,000 loops each)


For the sake of comparison, once again I present you the timing when using the purely imperative approach.


```python
%%timeit
fibonacci1(1000)
```

    36.3 μs ± 3.28 μs per loop (mean ± std. dev. of 7 runs, 10,000 loops each)


The numbers speak for themselves: the dynamic programming example runs in a fraction of the time used by other paradigms. This is because, most of the time, the function is just returning the value that had been previously calculated.

In case you were wondering, the cache is, indeed, preserved between runs, therefore constituting a side effect.


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

    40.5 ns ± 5.81 ns per loop (mean ± std. dev. of 7 runs, 10,000,000 loops each)


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

    37.3 ns ± 0.677 ns per loop (mean ± std. dev. of 7 runs, 10,000,000 loops each)


The other difference is that `cache` could be faster than `lru_cache` because, among other reasons, it doesn't manage limits. Care must be taken, though, because resource consumption could increase significantly over time <mark>and it would be very hard to pinpoint the root cause</mark>.

By the way, did you notice that the examples using `cache` and `lru_cache` ran faster than my previous code caching intermediate results internally (fibonacci4)?

## Tail recursion

<mark>This section is purely information, as Python (at least as of the time of this writing) doesn't support tail recursion optimization.</mark>

Tail recursion is defined as a recursive function in which the recursive call is the last statement that is executed by the function. So basically nothing is left to execute after the recursion call.[^4]

[^4]: Source: [GeeksforGeeks: What is Tail Recursion](https://www.geeksforgeeks.org/dsa/tail-recursion/)

Let's revisit the definition of `factorial2`:

```python
def factorial2(n: int) -> int:
    return 1 if n < 2 else n * factorial2(n-1)
```

The early impression is that the call to `factorial2(n-1)` is the last statement, so in principle we're good, but if we look at it in detail, we realize that the result of the call must be multiplied by `n`, therefore this is not tail recursion. The program must save the current context to its stack before calling itself, which results in extra resource utilization. One way of enforcing tail recursion is by creating an additional variable to serve as an accumulator and pass it to an internal function. This allows us to change the implementation **without** changing the function signature, thus preserving the rest of the program.


```python
def factorial4(n: int) -> int:
    def f4tr(n: int, acc: int) -> int:
        if n == 0:
            return acc
        else:
            return f4tr(n-1, n*acc)
    return f4tr(n, 1)
```

We can be sure the recursive call is the very last statement because there's nothing hanging on it. How does it perform?


```python
%%timeit
factorial4(1558)
```

    481 μs ± 15.2 μs per loop (mean ± std. dev. of 7 runs, 1,000 loops each)


No improvement over `factorial2` or `factorial3`, but then (again) Python does not currently support tail recursion optimization. If you were to try this on a different language, e.g. Ocaml or Elixir, you'd see a radical difference.

Just wrapping it up, how could we do it on the Fibonacci sequence?

```python
def fibonacci2(n : int) -> int:
    return n if n < 2 else fibonacci2(n-1) + fibonacci2(n-2)
```

In the case of a factorial, we created an extra variable to serve as the accumulator. For the Fibonacci sequence, we'd create two accumulators: one for `n-1` and one for `n-2`.


```python
def fibonacci2c(n: int) -> int:
    def f2tr(n: int, a: int, b: int) -> int:
        if n == 0:
            return a
        elif n == 1:
            return b
        else:
            return f2tr(n-1, b, a+b)
    return f2tr(n, 0, 1)
```


```python
%%timeit
fibonacci2c(30)
```

    1.57 μs ± 9 ns per loop (mean ± std. dev. of 7 runs, 1,000,000 loops each)



```python
%%timeit
fibonacci2c(1000)
```

    115 μs ± 761 ns per loop (mean ± std. dev. of 7 runs, 10,000 loops each)


It's faster than the non-tail recursive function, not due to tail recursion optimization (non-existent in Python nowadays), but because it's avoiding duplicate calls (for `n-1` and `n-2`).

## Functional programming is not perfect

Reading [Athreya aka Maneshwar's article on object oriented versus functional programming](https://dev.to/lovestaco/object-oriented-programming-encapsulation-moving-parts-and-functional-paradigms-30d0) made me think of it a little bit deeper. Let's review some principles.

### Functions must accept at least one argument

In this case, we can't have a random number generator. We can have arguments specifying the type of number, its length, or range, but depending on the implementation they aren't always required.

### Stateless

Given the same inputs, the output will always be the same. Really? For a random number generator, I definitely don't want to have the very same output over and over again. Even if it repeats itself, eventually I must get a different number.

As for file handling, assuming I'm reading from a file that hasn't changed, then I'm always reading the same data. If the file changes, however, we're breaking this rule.

The same applies to databases. After someone updates the database (which is usually expected), the data being read is no longer the same.

### Scalar variables are constant

All of the above is manageable and can be accepted, but if scalar variables must be constant, then there's no way we can implement a counter, for example.

Here's a counter class:


```python
class Counter1:
    def __init__(self) -> None:
        self.counter = 0
    def increment(self):
        self.counter += 1
        return self
    def get(self) -> int:
        return self.counter
```

The scalar variable `self.counter` is mutable and changes with every call to `increment`.


```python
c1 = Counter1()
c1.get()
```




    0




```python
[c1.increment().get() for x in range(10)]
```




    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]



Subsequent calls will yield increasing numbers. No surprises here.

Let's enforce the rule:


```python
class Counter2:
    def __init__(self, value=0) -> None:
        self.counter = value
    def increment(self):
        return Counter2(self.counter + 1)
    def get(self) -> int:
        return self.counter

```

The scalar variable `self.counter` is immutable. There is no provision to change it. Calling `increment` will, instead, instantiate a new object with a new, immutable, incremented value.


```python
c2 = Counter2()
c2.get()
```




    0




```python
c2 = c2.increment()
c2.get()
```




    1




```python
c2 = c2.increment()
c2.get()
```




    2



Subsequent calls will yield increasing numbers. No surprises here either… but there's a caveat: if we don't reassign the new object to a variable, we'll be working with stale data. For example:


```python
[c2.increment().get() for x in range(10)]
```




    [3, 3, 3, 3, 3, 3, 3, 3, 3, 3]



In this example, `c2` keeps pointing to the original object instead of the updated one. That's why it keeps returning the same value. Even worse, if we pass `c2` as an argument to another object, then for as long as the object is active, it will keep operating on obsolete data.

#### Let's solve this (and prove myself wrong)

Here's one way of doing it:


```python
class Hidden_Counter:
    def __init__(self, value=0):
        self.hidden_counter = value
    def increment(self):
        return Hidden_Counter(self.hidden_counter + 1)
    def get(self):
        return self.hidden_counter

class Counter3:
    def __init__(self):
        self.counter = Hidden_Counter()
    def increment(self):
        self.counter = self.counter.increment()
        return self.counter
    def get(self):
        return self.counter.get()
```

You add this code to a separate source file. Wherever you need to use it, you add `from <name> import Counter3`, which guarantees that `Hidden_Counter` remains hidden. `Hidden_Counter` keeps reinstatiating itself for every increment while `Counter3` keeps references intact.


```python
c3 = Counter3()
c3.get()
```




    0




```python
[c3.increment().get() for x in range(10)]
```




    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]



You can do the same using inner classes.


```python
class Counter4:
    class Hidden_Counter:
        def __init__(self, value=0):
            self.hidden_counter = value
        def increment(self):
            return Hidden_Counter(self.hidden_counter + 1)
        def get(self):
            return self.hidden_counter
    def __init__(self):
        self.counter = Hidden_Counter()
    def increment(self):
        self.counter = self.counter.increment()
        return self.counter
    def get(self):
        return self.counter.get()
```


```python
c4 = Counter4()
c4.get()
```




    0




```python
[c4.increment().get() for x in range(10)]
```




    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]



In many programming languages, no code outside of an enclosing class has any visibility of inner classes.

## The Golden Hammer antipattern

The Golden Hammer antipattern permeates from a development team's overreliance on a single tool set, pattern, platform, or other component of the development workflow. It is a classic pitfall that any team faces when they have gained some level of expertise in a particular solution or methodology. This antipattern is appropriately summarized using the following adage: "When all you have is a hammer, everything looks like a nail."[^5]

One of the main advantages of functional programming is its simplicity. Given the same results for the same inputs, and given there are no side effects, it's easy to debug. Resource consumption and execution time may be issues and must be taken into account. In my past experience as a software engineer, however, I should say that only in rare occasions I dealt with deep recursion levels. The most notable case was so many years ago, when I had to look up data in a hierarchical data structure. Resources were at a premium and my program was crashing at random intervals. My very talented data architect came to the rescue, creating a new database view for me, and my problems went away.

Or, at the least, that one.

There are purely declarative programming languages. Likewise, there are purely imperative programming languages. You *may* be stuck.

There are, nonetheless, multiparadigm programming languages. You'll have the option to choose how to write your code. Against the Golden Hammer antipattern, remember that you have multiple tools and techniques at your disposal, so do yourself a favor and choose the best one for solving the problem at hand.

[^5]: Source: [TechTarget: Signs of a Golden Hammer antipattern, and 5 ways to avoid it](https://www.techtarget.com/searchapparchitecture/tip/Signs-of-a-Golden-Hammer-antipattern-and-ways-to-avoid-it)

---

#### Revision history

1. 2024-05-15: Original posting date.
2. 2025-03-16: New hardware.
3. 2025-03-17: Problems with functional programming.
4. 2025-03-18: Correcting my own mistakes.
5. 2025-04-28: Spell check.
6. 2025-10-13: Tail recursion.
7. 2025-10-14: Minor cleanup.

---
