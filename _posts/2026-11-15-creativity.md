---
layout: post
title:  "I don't like this!"
categories: technology programming creativity linux ai artificial-intelligence
excerpt_separator: <!--more-->
date: 2026-11-15
---
[![creativity](/assets/images/annoyed.jpeg)](/creativity/)
<div style="font-size: 0.8em; text-align: right">Image source: Copilot</div>

Phrases like "I don't like this" and "there must be another way" often lead us to using one of our most valuable assets: creativity.
<!--more-->

## The nature of my conundrum

I've been using Linux for a very long time and, in recent years, starting using a Wayland compositor on my desktop. If this all sounds like an alien language to you, I'm sorry but it will only get worse.

A [Wayland compositor](https://en.wikipedia.org/wiki/Wayland_(protocol)) presents screen elements on a screen. An application wants to show something, it sends a request to the compositor, and (ta-daa) it's presented on the screen somehow. It also communicates back to the application what the user is doing, such as clicking the mouse or typing a key on the keyboard. Nothing less and nothing more. That's what [Hyprland](https://hypr.land/), [niri](https://niri-wm.github.io/niri/), [Sway](https://swaywm.org/), and so many others do. Unlike desktop environments such as GNOME and KDE, as well as monolithic operating systems like MacOS and Windows, there's no provision to launch an application, see what programs are running, not even check the date and time. Nothing!

That's why people like me, passionate about Wayland compositors and window managers, got used to using other applications for supplementing these notable absences. Other than web browsers, email clients, office suites, and anything else you can think of, we need a file manager, maybe a text editor, and certainly some status bar somewhere to show running applications, date, time, computer status, and other indicators. You may want an application launcher included on it, or as a separate application whatsoever.

That's one of a million reasons why I like Linux: the possibilities are endless.

### The top bar

That's what brought me here. The top bar is what I just mentioned above. It can be on the top of the screen, on the bottom, on each side, or floating. Whatever floats your boat. Pun intended. I'll just call it the top bar.

I've been using [Waybar](https://github.com/Alexays/Waybar) for a long while. It's customizable. I can choose the type of information to be displayed and what can be ignored. I can format it to my liking. I can configure it to interact with me the way I want. Sounds perfect, huh?

But sometimes I feel like it's missing something. That's when I found [Quickshell](https://quickshell.org/). It seemed to be far more configurable and extensible than Waybar, so I decided to give it a try. It worked very well…

But only up to a point. The documentation is complex and (sadly enough, but not surprisingly enough) the tutorial didn't work. Even after copying and pasting from the website, it still complained about errors. Eventually I told myself there has to be a better way.

[Piotr Miller](https://github.com/nwg-piotr) developed a number of tools, some of which I've been using for ages. With all due respect, I didn't find what I was looking for, so I made the ultimate decision: <mark>I will do it myself</mark>. There's an art and a science to software engineering. The science is the science, but the art is like riding a bycicle: once you've learned it, you'll never forget.

## If I build it, will they come? 🤔

Ken Thompson created UNIX for himself. Linus Torvalds created Linux and Git for himself. I wonder what other hobbies became successful mainstream products.

But I have no illusions of grandeur. If you like this tool, I thank you. If you want to use it, I'm humbled. If you want to build something based on my ideas, be my guest, but if you want to build upon the tool, then per the [license agreement](https://www.gnu.org/licenses/agpl.html) you are required to provide the source code, just like I'm doing. Please see [the repo](https://codeberg.org/taflaj/topbar).

### Design principles

**No configuration files!** This is an idea that came to me from [dwm](https://dwm.suckless.org/) and its Wayland equivalent [dwl](https://codeberg.org/dwl/dwl). There is no configuration file. If you like it, good. If you don't like, you change the source code and recompile it. If the change is too complex and there's a solution out there, you patch the code and recompile it. Easy… for those who know what they're doing.

I'm doing this because, in my humble opinion, for smaller applications, configuration files add an unnecessary overhead. For example, niri keeps reading my configuration file looking for changes. When there is a change, it adjusts itself. One advantage is that I can tweak it all I want and see the outcome right away. The problem is that it uses system resources to keep reading the configuration file and to readjust itself. If I don't change my configuration file, then it's spending time just wasting my computer resources. Also, if I'm not using a given feature, that's fine, but the code that implements all the features I'm not using is still there, possibly wasting more computer resources.

Waybar and Quickshell, on the other hand, only read the configuration file during startup. To reapply the new settings, you stop the program and start it again. Still, the code for all the features I'm not using remains dormant and taking up resources.

By eliminating configuration files, you're required to modify the source code, but you know that the code only does what you want and nothing else. No overhead. No logic to read configuration files. No unwanted features.

**Simple programming with minimum overhead!** Waybar and Quickshell are written in C++. I'm cool with that, but I don't really *like* C++. This is subjective, but despite its power, I think it's *ugly*.

I really like OCaml, but it's a niche language and doesn't have all the bindings I need. I also love Elixir, but having to instantiate a super virtual machine like Beam brings a lot of overhead. An easier alternative could be Haskell ([xmonad](https://xmonad.org/) is a tiling window manager completely built in Haskell which doesn't use configuration files either) but, by doing so, I'd be alienating a number of colleagues.

And then there's Python. It's an incredibly powerful but simple language. There are plenty of tools out there written in Python, including some works by Piotr Miller, and even another tiling window manager ([Qtile](https://qtile.org/); it follows the same principle of not having configuration files). The problem is that the Python interpreter must first compare the source code to the precompiled intermediate binary, recompile if needed, and then interpret the binary code. With each release, the interpreter becomes more efficient, but there's still significant overhead. I'll let the numbers on the table at the end of [my other article](/pi-montecarlo) speak for themselves.

What's left? Rust and Go.

### Public enemy #1

In order to find a suitable solution, I had to do extensive research on each language toolkits, libraries, bindings, et al. For Rust, I evaluated `iced` and `gtk-rs`, especially `iced_exwlshell` for building GTK layer shell applications. On the Go side, I evaluated `gotk4` and `Fyne`, wrapping up with `gotk4-layer-shell`. The thing is that, to build a top bar, you need to go down the GTK4 layer shell. It may sound complicated, but with the right bindings, all you have to do is instantiate a GTK4 layer shell and command it through its API.

Having decided on the technical stack, the next step was to build proofs of concept for Rust and Go. I wanted a top bar to interact with my active niri workspaces, display the battery charge level (showing it in red when it becomes critical), local time (constantly updated, obviously), and the system tray. My Waybar configuration is far more complex, though.

This is something I had never done before. Some of the terms I mentioned above were completely unbeknownst to me. Considering my full time job, to acquire all this knowledge and to build the proofs of concept, it would take me months.

Which I obviously couldn't afford.

Ergo, I appealed to public enemy number one: **AI**. Blasphemy! {% include pullquote.html quote="My developer's soul is hereby commanded to burn in digital hell forever." %}

Let's be honest. The full exercise of researching the possibilities and alternatives, understanding the implications, and creating two working prototypes took me a few hours. I'm on a Claude free plan, but if I were to pay for it, it would cost me some pocket change. It saved me months of work.

Unlike some people, though, I'm not taking the generated code as the definite word. After I understood what it does, I tweaked it to my liking, and finally used it as a base for building my tool.

### How did it perform?

Measuring performance is ridiculous. The top bar remains dormant most of the time, waking up every second just to display the current time. If I don't care about seconds on the top bar, and I really don't, then I can refresh it every 3, 5, or 10 seconds. It doesn't make sense to measure its performance.

These are some *valuable* metrics, with Waybar as baseline:

| Artifact | Binary Size | Memory Use |
| :--- | ---: | ---: |
| Go | 52 MB | 96 MB |
| Rust (debug) | 116 MB | 82 MB |
| Rust (release) | 7.7 MB | 78 MB |
| Waybar | 3.4 MB | 41 MB |

The size of the binary file is not too relevant. It takes up disk space, but it only matters when the program is being loaded. The bigger file will be a subfraction of a millisecond slower to start running. Once it's running, nobody cares.

Memory use is an issue. Debug mode in Rust is used only for development and testing; once the program is ready for prime time, all that matters is the release mode. It takes more than 1.9× the baseline. As for Go, it's more than 2.3×. In relative terms, it's bad.

In absolute terms, however, it's debatable. As of this writing, other than web browsers, email client, and [Zed](https://zed.dev/) (my faithful IDE), while also ignoring system services, the worst memory hog I have is [Insync](https://www.insynchq.com/), which I use to keep my cloud and local files in sync. Everything else is using less memory than the Rust (release) prototype.

And by the way, it's a prototype. It's not even the final working version that I'm making compatible with my Waybar setup.

But I don't believe in miracles. Even though Waybar is only consuming 41 MB, how much else is being consumed by its services and resources? The same question applies to the Rust and Go prototypes. Go and Rust both use static linking, in which all required libraries are included on the binary file, but C++ could either do static or dynamic linking, depending on the build process. For the latter, upon loading, the program loads the libraries it needs.

Are all the libraries built in? One, for sure, is not: `libgtk4-layer-shell.so`. That's for the bindings I mentioned earlier. One way or another, the memory consumed by the program itself is only part of the equation. There's far more being used.

This all brings us to the million dollar question:

### Is it worth it?

For me, a resounding **YES**! The top bar looks exactly how I want it, and it was all my creation. Along the way, I learned things I had never heard of before, and had no idea they existed.

So why did I use Go instead of Rust? I'm still too green at Rust. I'm curious, and that's why I gave it a shot, but I'm far more familiar with Go. Go, for me, is like second nature, and I feel quite at home with it. Maybe in the near future I can say the same about Rust?

Or maybe not.
