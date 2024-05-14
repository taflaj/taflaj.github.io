---
layout: post
title:  "Are you GOing?"
categories: technology programming golang
---
A few months ago I was exposed to Go, a new programming language (at least for me). Being well versed in some of the modern environments and frameworks, I usually don't pay much attention to new languages, unless there's something of interest to me. In this case, there was. In fact, there are some strong aspects in Go which I haven't seen as frequently.

## I'm Sorry, World

Whenever talking about a programming language, many authors refer to a hello program, which does nothing but say, "Hello, world!" It usually serves as a good starting point. I'm drinking from the same fountain… but the results are discouraging!

Here's my version in Go.

```go
// hello.go

package main

import "fmt"

func main() {
  fmt.Println("Hello, world!")
}
```

The only thing unusual about it is the executable file size. I'm using Go 1.6.2 darwin/amd64 on a Mac with Apple LLVM version 7.3.0 (clang-703.0.31), and the resulting file is 2.1 MB long. I repeat: 2,249,680 bytes.

For the sake of comparison, these are the equivalent source files in C, C++, and Java (1.8.0_72-b15), along with the executable file sizes.

```c
/*
 * hello.c: 8.2K
 */
#include <stdio.h>
void main() {
  puts("Hello, world!");
}
```

```c++
/*
 * hello.cpp: 15K
 */
#include <iostream>
using namespace std;
int main() {
  cout << "Hello, world!" << endl;
}
```

```java
/*
 * Hello.java: 417 bytes
 */
public class Hello {
  public static void main(String[] args) {
    System.out.println("Hello, world!");
  }
}
```

I've obtained comparable results on Windows and on Linux. Let me get this straight: one of the decision points to switch to Go should not be the executable file size.

## Comparing to Java

On the next sections I'll establish a brief comparison to Java, which is the language I mostly use at work.

Java (and the Java virtual machine, for that matter) is very powerful and gives developers plenty of control. The downside is that, if you always do the same in a similar manner, then you're always adding more of the same code. From this perspective, Go simplifies the development process by implementing the same functionality in a more straightforward way. These are a few examples.

### Multithreading

Generally speaking, I refer to multithreading as the ability of a given program to do more than one thing at the same time (or, at the least, appear to be doing so). This is usually implemented by the run time environment, with or without support from the operating system.

In Java, at the very least, you have two alternatives to accomplish this in your programs: by subclassing `Thread`, or by implementing the `Runnable` interface.

#### Subclass Thread

This is the basic skeleton:

```java
class MyThread extends Thread {
  MyThread() {
    // thread initialization, if needed
  }

  public void run() {
    // do something
  }
}
```

There is room for any initialization code you need, and whatever code must be executed as part of this thread goes into the run function. You can launch a new thread by using something like:

```java
(new MyThread()).start();
```

#### Implement Runnable

The basic skeleton, as expected, is not too different:

```java
class MyRunnable implements Runnable {
  MyRunnable() {
    // thread initialization, if needed
  }

  public void run() {
    // do something
  }
}
```

Likewise, you can launch a new thread with:

```java
(new Thread(new MyRunnable())).start();
```

#### Goroutines

To accomplish multithreading in Go, you create *goroutines*, which follow a rather simple mechanism: you declare a function that contains the initialization and execution code, and run it asynchronously. For example:

```go
package main

func f() {
  // initialization, if needed
  // do something
}
```

To launch this function as a goroutine, you can use:

```go
go f()
```

You can accomplish the same result through the use of an anonymous function:

```go
go func() {
  // your code
}()
```

Needless to say, as is the case on any functions, you can define and pass whatever parameters are required. Unfortunately you don't have this luxury in Java, as `start` and `run` are parameterless functions, so you have to resort to other mechanisms.

### Synchronization

In a multithreaded program, each thread runs in parallel with others. Often times it's required for a given thread to interact with others. There are multiple techniques for accomplishing this in Java, but I'm listing only two.

#### Bad Java

I've seen this in the past. It's bad but, despite its multiple disadvantages, gets the job done. You start by declaring a global flag to signal something has changed:

```java
volatile boolean flag;
```

When you declare a variable to be volatile, you are telling the JVM to always store it in memory. This way, any threads accessing it will have to do it on the same place. In other words, all threads are always using the most up to date contents. Otherwise, you run the risk of having it temporarily stored on the CPU cache. As result, at a given point in time, there may be multiple different instances of the same variable, each with a different value. This is definitely something you want to avoid whenever you're considering synchronization.

Let's assume that, whenever something happens and you want the thread to do something about it, you set flag to true. The thread could then take action with the following code:

```java
while (true) {
  if (flag) {
    // clear flag so it can be reused
    flag = false;
    // do something else
  }
  Thread.sleep(millis);
}
```

The only advantage I can see in this approach is that it's simple. Some of the disadvantages include:

- **Slow response.** After the event is processed, the thread will sleep for these many milliseconds. If the next event occurs in the middle, the thread will still wait for the remaining time to elapse before taking charge again.

- **Wastes time and effort.** The monitoring thread will continue running even if there are no new events (flag remains false).

#### Better Java

You can achieve faster response time and better performance by suspending the thread until a new event happens. For example, this should go in a `synchronized` block:

```java
while (!flag) {
  wait();
  flag = false;
  // do something
}
```

You should notify the monitoring thread also inside a `synchronized` block:

```java
flag = true;
notifyAll();
```

#### Channels

Go uses channels for establishing synchronized communication across goroutines. You can create a channel using `make(chan val-type [, size])`, optionally defining the number of values the channel can hold (in the case of buffered operations), and then use the `<-` operator for passing values to a channel and retrieving from it. For example:

```go
values := make(chan int)  // create the channel
//
values <- i  // pass a value to the channel
//
n <- values  // get value from the channel
```

Go will automatically take care of suspending any goroutines awaiting data from a channel.

## Conclusion

There is no conclusion! Just like development environments and application frameworks, no programming language is perfect. There is a space for Java, as much as there is space for .NET, Python, and PHP, and so there is also space for Go. Ultimate it's up to you to decide when and where to use it, but at least you have a good starting point.