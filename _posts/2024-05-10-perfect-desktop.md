---
layout: post
title:  "The quest for the perfect desktop"
categories: technology linux
---
TL;DR On my desktop PC I'm currently running Fedora Silverblue 40. Same on my laptop, but rebased to Sway Atomic.

## A very long history in the making

My first encounter with Unix was in the late 1980s, when I was formally trained in System V/68. There was this board with a Motorola 68000 CPU that could be inserted into a slot on the IBM PC which would convert it into a Unix server with enough capacity to support a small number of terminals, and the course was centered on that. At that time I was working as a software engineer for a company producing video display terminals, and so it made perfect sense for me to be there. Being familiar with CP/M, MS-DOS, and others, Unix seemed really sophisticated, yet simple to use.

Fast forward to the late 1990s, I bought a copy of Red Hat Linux 6.1 and installed it on an old PC of mine that was already too weak to run Windows. It was disappointing to see that Red Hat Linux 6.2 was released a few days later, but what can you do? Eventually that PC broke for good and I moved on.

### The Ubuntu years

I believe it was 2005 when I first heard about [Ubuntu][ubuntu], which was a brand new distro, and decided to give it a try.

It was easy to install.

It was easy to configure.

It was very easy to use.

And so Ubuntu 4.10 became my daily driver, soon upgraded to 5.04 and to the versions that followed. It was somewhat easy to connect to my home computer from work, which proved to be useful. Although my wife was familiar with Windows, she had no trouble with Ubuntu and GNOME.

Coming 2011, GNOME 3 was released. I didn't like it! It was a new paradigm that I was not in favor of. KDE was too full of fluff, so I opted for Xfce, which was much simpler to use, had a familiar look and feel, and was low on resource consumption. I remained with [Xubuntu][xubuntu] for several years.

By 2018, KDE Plasma 5 was well established and very pleasing to the eyes and to this user. Instead of [Kubuntu][kubuntu], I switched to [KDE neon][neon]. People at work questioned me on my choice, but the answer was simple. "Reputable company A has solid product A, fully open source with a well documented API. They want to integrate it with solid product B from reputable company B, which is also fully open source with a well documented API. Company B wants to do the same, that is, integrating their product with product B. Who does it better: A or B?" There is no clear winner, so it's all a matter of personal taste. At that particular time I was more interested in KDE, and that was my decision.

### Distro hopping

At the heart of [KDE neon][neon] we had the trustworthy [Ubuntu][ubuntu], but certain things were just not working for me. Where was the problem: KDE or [Ubuntu][ubuntu]? I tried Xubuntu 18.10, just to make sure, and the same problems persisted. It was time to walk away.

In comes [Manjaro][manjaro]. I did not have the time, neither the patience, to set up [Arch Linux][arch], hence my choice. It worked very well for me for quite some time. People at work barely noted the difference. The resident expert warned me against using [Arch Linux][arch] or their descendants. Although the distro is quite stable, the [Arch User Repository (AUR)][aur] is anything but. There are too frequent and overwhelming updates, mostly to fix what they broke on a previous one. There was plenty of wealth within [AUR][aur] and I decided to take the risk. In effect, it was not rare for me to start a system update and realize that there were dozens (if not hundreds) of new packages. After a while, it became rather inconvenient.

The next several weeks were exhausting. Using [DistroWatch][distrowatch] as my guide, I tried [MX Linux][mx], [Linux Mint][mint], [AlmaLinux OS][alma] ([if it's good for CERN and Fermilab, then it must be good for me][cern]), and so many others, all of them with their pros and cons, and all of them with some little unique annoyance that would irritate me.

Red Hat Linux was no more. I could either choose Red Hat Enterprise Linux or [Fedora][fedora]. I chose the latter. My past experience with [AlmaLinux OS][alma] was not satisfactory enough.

[Fedora][fedora] was a great fit for me! There were frequent updates, but not overwhelmingly so. In fact, it was the perfect balance between advancements and stability.

When [Red Hat/IBM built a paywall around CentOS Stream][centos], sending shockwaves across the open source industry, I felt inclined to walk away from [Fedora][fedora] and revisit other truly community supported distros. My first stop was with the venerable [Debian][debian]. Version 12 had just been released, with a significant number of improvements, and it looked very appealing to me. By that time, I was already excited, once again, to use GNOME, and so [Debian][debian] became my daily driver. It's heavily stable, which could also mean archaic, and some tools did seem a little outdated. Using [distrobox][dbox], I was able to overcome plenty of limitations.

The problem with [Debian][debian] is that **I am a bad user**; the same applies to most other distros. Even though [distrobox][dbox] allowed me to safely bypass system limitations by installing programs on a containerized environment, sometimes it just felt *easier* to install on the root system. Over time, there were so many broken dependencies on the system that updates and new installations became rather painful. Backup tools such as [Snapper][snapper] and [Timeshift][timeshift] are fantastic for restoring configurations, but only for a short period of time; restoring a rather old configuration is impractical. The only reasonable approach was to reinstall the system and to remember to be disciplined.

But if I had to start from scratch, I'd rather do something new. In comes [Arch Linux][arch]. Not a descendant, but the real thing. Installation was flawless, thanks to [Stephen's Tech Talks][stt] [example][guide], and in no time I had my desktop up and running. A few weeks later, after assuring myself of the system's stability, I proceeded to install [Arch Linux][arch] on my laptop.

And then the problems began. Some tools I use were crashing. I tried both the AUR and the Flatpak versions, and got the same result. Did I make a mistake during the installation? Maybe… Let's try a descendant. [EndeavourOS][endeavouros], [ArcoLinux][arco], and [Garuda Linux][garuda] all yielded the very same result. It tells me the problem is inside [Arch Linux][arch]. Searching the forums did not give me any good answers. In any event, everything else was working, so for the next few weeks I'd work around these annoyances. I also kept any and all updates on the desktop on hold because I knew that eventually it would crash as well.

I couldn't wait long, though. It became necessary to install a new application on the desktop, but the installer required a full system update. I crossed my fingers and went on with it. The behavior of the faulty tools improved and weren't crashing, which gave me some hope. Back on the laptop, I performed a new full system update and tried, once again, to install those tools. Most of them worked, except for one (obviously the most critical one).

And so I gave up. Having to reinstall systems over and over again is not for me anymore. I wanted something that could stick with me for years to come.

### Time traveling

I still am a bad user. That's why I believe that an immutable system would work best for me. [DistroWatch lists a number of immutable distros][immutable], but most of them lacked the level of maturity I needed. I tried [NixOS][nixos] and was very impressed by it, but some applications didn't behave they way they should. I also tried [openSUSE MicroOS][microos], but some of the components were still release candidates, which didn't give me the confidence I deserved from a stability stand point.

My next attempt was with [Fedora][fedora]. I had a copy of Fedora Silverblue 39, which I had tinkered with in the past. I had used it for experimenting only. Despite a few glitches, I was able to get [i3][i3wm], [hyprland][hypr], and even [dwm][suckless] running on it. Fedora 40 had just been released, so I downloaded it and proceeded to install it on the laptop. But it failed… Not interested in debugging it, I installed 39 (which I knew for a fact that it worked well) to later upgrade it to 40.

As I was going over the [documentation][upgrade] and preparing for the upgrade, something caught my attention. If I wanted, I could travel back to 2017 to tinker with Fedora 27, or to the near future to try Fedora Testing or Fedora Updates, or even to the far future and experiment with Fedora Rawhide. All that without breaking my system? Count me in! But not today… Instead, I preferred to remain in 2024 and upgrade my laptop to Fedora Silverblue 40.

With everything working as it should, including some third party and proprietary tools I need, the next step was to convert the desktop. Installing Fedora Silverblue 40 failed as well, so I followed the same procedure: install 39 and upgrade.

Unless something goes terribly wrong (or something magical happens), there's no more distro hopping for me. For the foreseeable future, I'm staying with [Fedora atomic desktops][fedora].

## Today

Even if not distro hopping anymore, I'm still compelled to hop from one desktop environment to another. I've rebased my laptop to Sericea (that's the name listed on the rebase tool, even though the website refers to it as Sway Atomic). It only took me a few minutes to do so, and none of my configurations and custom installed applications were lost. I've pinned my last successful Silverblue (GNOME) version so as not to lose it, for when I decide to go back. I just need to remember to pin the current version.

I've always known that GNOME and KDE Plasma were not meant to coexist, but what if I rebase to Kinoite? My wife might prefer KDE, or maybe even Budgie, over GNOME, so I'll leave the door open. On my laptop, however, I'm more in favor of [Sway][sway] because jumping between the keyboard and the touchpad is a waste of time, and a tiling window manager allows me to spend the vast majority of my time on the keyboard alone.

After spending significant time on [dwm][suckless], I got used to automatic tiling. [Sway][sway], just like [i3][i3wm], forces me to remember the tiling scheme before opening a new window, or to rearrange the windows if the opposite scheme was in place. I stumbled on [Brodie's][brodie] [recommendation][recommend] by accident and installed [autotiling][auto], to my utterly joy.

### System updates

Regardless of the distro I used, updating the system has always been aggravating. The system slows down to a crawl and, after the update, it's rather useless: either an application asks you to restart it, or it stops responding altogether. There were also times where the system somewhat *demanded* to be updated. On an atomic desktop, there's no such thing: the system updates itself automatically in the background, and you don't even notice, but the changes will only come into effect **after** you reboot your system.

Indeed, I'm happy to report that my computer is working exactly the way I want it.

[alma]: https://almalinux.org/
[arch]: https://archlinux.org/
[arco]: https://arcolinux.com/
[aur]: https://aur.archlinux.org/
[auto]: https://github.com/nwg-piotr/autotiling
[brodie]: https://www.youtube.com/channel/UCld68syR8Wi-GY_n4CaoJGA
[centos]: https://www.servethehome.com/ibm-red-hat-puts-rhel-source-behind-paywall/
[cern]: https://www.businesswire.com/news/home/20230413005066/en/AlmaLinux-to-be-Used-by-CERN-and-Fermilab-in-Groundbreaking-Physics-Experiments
[dbox]: https://distrobox.it/
[debian]: https://www.debian.org/
[distrowatch]: https://distrowatch.com/
[endeavouros]: https://endeavouros.com/
[fedora]: https://fedoraproject.org/
[garuda]: https://garudalinux.org/
[guide]: https://www.youtube.com/watch?v=zQQN3Pj4K0Y
[hypr]: https://hyprland.org/
[i3wm]: https://i3wm.org/
[immutable]: https://distrowatch.com/search.php?category=Immutable#simple
[kubuntu]: https://kubuntu.org/
[manjaro]: https://manjaro.org/
[microos]: https://microos.opensuse.org/
[mint]: https://www.linuxmint.com/
[mx]: https://mxlinux.org/
[neon]: https://neon.kde.org/
[nixos]: https://nixos.org/
[recommend]: https://www.youtube.com/watch?v=xCqPgQ-Vh3E
[snapper]: https://github.com/openSUSE/snapper
[stt]: https://www.youtube.com/channel/UCw5X5HfFVvErNL6-e0ol50g
[suckless]: https://dwm.suckless.org/
[sway]: https://swaywm.org/
[timeshift]: https://github.com/linuxmint/timeshift
[ubuntu]: https://ubuntu.com/
[upgrade]: https://docs.fedoraproject.org/en-US/fedora-silverblue/updates-upgrades-rollbacks/
[xubuntu]: https://xubuntu.org/
