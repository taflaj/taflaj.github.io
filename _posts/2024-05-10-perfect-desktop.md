---
layout: post
title:  "The quest for the perfect desktop"
categories: technology linux
date: 2024-05-10
last_modified_at: 2025-05-08
excerpt_separator: <!--more-->
---
[![My Perfect Desktop](/assets/images/desktop.jpg)](/perfect-desktop/)

On my desktop PC I'm currently running Arch Linux with [MATE Desktop][mate]. On my laptop I have [Fedora Silverblue][fedora] rebased to [Aurora DX][aurora]. It took me significant time and effort to come here, though.
<!--more-->

## A very long history in the making

My first encounter with Unix was in the late 1980s, when I was formally trained in System V/68. There was this board with a Motorola 68000 CPU that could be inserted into a slot on the IBM PC which would convert it into a Unix server with enough capacity to support a small number of terminals, and the course was centered on that. At that time I was working as a software engineer for a company producing video display terminals, and so it made perfect sense for me to be there. Being familiar with CP/M, MS-DOS, and others, Unix seemed really sophisticated, yet simple to use.

Fast forward to the late 1990s, I bought a copy of Red Hat Linux 6.1 and installed it on an old PC of mine that was already too weak to run Windows. It was disappointing to see that Red Hat Linux 6.2 was released a few days later, but what can you do? Eventually that PC broke for good and I moved on.

### The Ubuntu years

I believe it was 2005 when I first heard about [Ubuntu][ubuntu], which was a brand new distro, and decided to give it a try.

It was easy to install.

It was easy to configure.

It was very easy to use.

And so Ubuntu 4.10 became my daily driver, soon upgraded to 5.04 and to the versions that followed. It was somewhat easy to connect to my home computer from work, which proved to be useful. Although my wife was familiar with Windows, she had no trouble with Ubuntu and GNOME 2.

Coming 2011, GNOME 3 was released. I didn't like it! It was a new paradigm that I was not in favor of. KDE was too full of fluff, so I opted for Xfce, which was much simpler to use, had a familiar look and feel, and was low on resource consumption. I remained with [Xubuntu][xubuntu] for several years.

By 2018, KDE Plasma 5 was well established and very pleasing to the eyes and to this user. Instead of [Kubuntu][kubuntu], I switched to [KDE neon][neon]. People at work questioned me on my choice, but the answer was simple. "Reputable company A has solid product A, fully open source with a well documented API. They want to integrate it with solid product B from reputable company B, which is also fully open source with a well documented API. Company B wants to do the same, that is, integrating their product with product A. Who does it better: A or B?" There is no clear winner, so it's all a matter of personal taste. At that particular time I was more interested in KDE, and that was my decision.

### Distro hopping

At the heart of [KDE neon][neon] we had the trustworthy [Ubuntu][ubuntu], but certain things were just not working for me. Where was the problem: KDE or [Ubuntu][ubuntu]? I tried Xubuntu 18.10, just to make sure, and the same problems persisted. It was time to walk away from Ubuntu.

In comes [Manjaro][manjaro]. I did not have the time, neither the patience, to set up [Arch Linux][arch], hence my choice. It worked very well for me for quite some time. People at work barely noted the difference. The resident expert warned me against using [Arch Linux][arch] or their descendants. <a id="aur"></a>Although the distro is quite stable, the [Arch User Repository (AUR)][aur] is anything but. There are too frequent and overwhelming updates, mostly to fix what they broke on a previous release. There was plenty of wealth within [AUR][aur] and I decided to take the risk. In effect, it was not rare for me to start a system update and realize that there were dozens (if not hundreds) of new packages. After a while, it became rather inconvenient.

The next several weeks were exhausting. Using [DistroWatch][distrowatch] as my guide, I tried [MX Linux][mx], [Linux Mint][mint], [AlmaLinux OS][alma] ([if it's good for CERN and Fermilab, then it must be good for me][cern]), and so many others, all of them with their pros and cons, and all of them with some little unique annoyance that would irritate me.

Red Hat Linux was no more. I could either choose Red Hat Enterprise Linux or [Fedora][fedora]. I chose the latter. My past experience with [AlmaLinux OS][alma] was not satisfactory enough.

[Fedora][fedora] was a great fit for me! There were frequent updates, but not overwhelmingly so. In fact, it was the perfect balance between advancements and stability.

When [Red Hat/IBM built a paywall around CentOS Stream][centos], sending shockwaves across the open source industry, I felt inclined to walk away from [Fedora][fedora] and revisit other truly community supported distros. My first stop was with the venerable [Debian][debian]. Version 12 had just been released, with a significant number of improvements, and it looked very appealing to me. By that time, I was already excited, once again, to use GNOME, and so [Debian][debian] became my daily driver. It's heavily stable, which could also mean archaic, and some tools did seem a little outdated. Using [Distrobox][dbox], I was able to overcome plenty of limitations.

The problem with [Debian][debian] is that **I am a bad user**; the same applies to most other distros. Even though [Distrobox][dbox] allowed me to safely bypass system limitations by installing programs on a containerized environment, sometimes it just felt *easier* to install on the root system. Over time, there were so many broken dependencies on the system that updates and new installations became rather painful. Backup tools such as [Snapper][snapper] and [Timeshift][timeshift] are fantastic for restoring configurations, but only for a short period of time; restoring a rather old configuration is impractical. The only reasonable approach was to reinstall the system from scratch and to remember to be disciplined.

But if I had to start from scratch, I'd rather do something new. In comes [Arch Linux][arch]. Not a descendant, but the real thing. Installation was flawless, thanks to [Stephen's Tech Talks][stt] [example][guide], and in no time I had my desktop up and running. A few weeks later, after assuring myself of the system's stability, I proceeded to install [Arch Linux][arch] on my laptop.

<a id="past"></a>And then the problems began. Some tools I use were crashing. I tried both the AUR and the Flatpak versions, and got the same result. Did I make a mistake during the installation? Maybe… Let's try a descendant. [EndeavourOS][endeavouros], [ArcoLinux][arco], and [Garuda Linux][garuda] all yielded the very same result. It tells me the problem is inside [Arch Linux][arch]. Searching the forums did not give me any good answers. In any event, everything else was working, so for the next few weeks I'd work around these annoyances. I also kept any and all updates on the desktop on hold because I knew that eventually it would crash as well.

I couldn't wait long, though. It became necessary to install a new application on the desktop, but the installer required a full system update. I crossed my fingers and went on with it. The behavior of the faulty tools improved and weren't crashing, which gave me some hope. Back on the laptop, I performed a new full system update and tried, once again, to install those tools. Most of them worked, except for one (obviously the most critical one).

And so I gave up. Having to reinstall systems over and over again is not for me anymore. I wanted something that could stick with me for years to come.

### Time traveling

I still am a bad user. That's why I believe that an immutable or atomic system would work best for me. [DistroWatch lists a number of immutable distros][immutable], but most of them lacked the level of maturity I needed. I tried [NixOS][nixos] and was very impressed by it, but some applications didn't behave they way they should. I also tried [openSUSE MicroOS][microos], but some of the components were still release candidates, which didn't give me the confidence I deserved from a stability stand point.

My next attempt was with [Fedora][fedora]. I had a copy of Fedora Silverblue 39, which I had tinkered with in the past. I had used it for experimenting only. Despite a few glitches, I was able to get [i3][i3wm], [Hyprland][hypr], and even [dwm][suckless] running on it. Fedora 40 had just been released, so I downloaded it and proceeded to install it on the laptop. But it failed… Not interested in debugging it, I installed 39 (which I knew for a fact that it worked well) to later upgrade it to 40.

As I was going over the [documentation][upgrade] and preparing for the upgrade, something caught my attention. If I wanted, I could travel back to 2017 to tinker with Fedora 27, or to the near future to try Fedora Testing or Fedora Updates, or even to the far future and experiment with Fedora Rawhide. All that without breaking my system? Count me in! But not today… Instead, I preferred to remain in 2024 and upgrade my laptop to Fedora Silverblue 40.

With everything working as it should, including some third party and proprietary tools I need, the next step was to convert the desktop. Installing Fedora Silverblue 40 failed as well, so I followed the same procedure: install 39 and upgrade.

Unless something goes terribly wrong (or something magical happens), there's no more distro hopping for me. For the foreseeable future, I'm staying with [Fedora atomic desktops][fedora].

### System updates

Regardless of the distro I used, updating the system has always been aggravating. The system slows down to a crawl and, after the update, it's rather useless: either an application asks you to restart it, or it stops responding altogether. There were also times where the system somewhat *demanded* to be updated. On an atomic desktop, there's no such thing: the system updates itself automatically in the background, and you don't even notice, but the changes will only come into effect **after** you reboot your system.

## 2 June 2024

I'm having a serious problem on my desktop. The beauty of atomic distros is that all updates are in full. If anything goes wrong during the update, it's rolled back automatically. That's not the problem.

The problem is that one such update went through to completion, but it rendered my desktop unusable. It had to do with [Wayland on Radeon graphics](https://gitlab.freedesktop.org/mesa/mesa/-/issues/11352). This affected not only Fedora, but everyone with a similar hardware configuration. Switching to another distro wouldn't cut it. I knew a solution was under way, but what could I do in the meantime? Using X11 instead of Wayland allowed me to continue working, but the computer became noticeably slow. Switching to Budgie, despite the smaller footprint, wasn't good enough either. Thankfully, collaborators on the [Fedora forum](https://discussion.fedoraproject.org/t/how-can-i-do-a-partial-silverblue-upgrade/123948) came to my rescue with a temporary fix. It demanded plenty of reconfiguration, along with setting up a Fedora container for building it. Under normal circumstances, I would have broken the system beyond repair, but due to its atomic nature, I could try and rollback numerous times until it's working for me.

After a few days, a solution came in, and I was able to update my computer normally.

## 5 October 2024

Even if not distro hopping anymore, I'm still compelled to hop from one desktop environment to another. I've rebased my laptop to Sericea (that's the name listed on the rebase tool, even though the website refers to it as Sway Atomic). It only took me a few minutes to do so, and none of my configurations and custom installed applications were lost. I've pinned my last successful Silverblue (GNOME) version so as not to lose it, for when I decide to go back. I just need to remember to pin the current version.

I've always known that GNOME and KDE Plasma were not meant to coexist, but what if I rebase to Kinoite? My wife might prefer KDE, or maybe even Budgie, over GNOME, so I'll leave the door open. On my laptop, however, I'm more in favor of [Sway][sway] because jumping between the keyboard and the touchpad is a waste of time, and a tiling window manager allows me to spend the vast majority of my time on the keyboard alone.

After spending significant time on [dwm][suckless], I got used to automatic tiling. [Sway][sway], just like [i3][i3wm], forces me to remember the tiling scheme before opening a new window, or to rearrange the windows if the opposite scheme was in place. I stumbled on [Brodie's][brodie] [recommendation][recommend] by accident and installed [autotiling][auto], to my utterly joy.

## 29 October 2024

[Fedora 41](https://fedoramagazine.org/announcing-fedora-linux-41/) has been released: let's upgrade!

On a regular distro, upgrades take a few minutes. Once you reboot the computer, you have a new system. Much the same on an atomic distro, but with one difference: upgrades take several minutes. At one time, it took longer than 10 minutes, plus rebooting. There must be a better way!

The way Fedora atomic is structured, you have the base system with everything it needs to function. Most other applications are installed as flatpaks, running in their own micro-container space. Some people hate flatpaks, but I'm cool with them.

What about applications that aren't available as flatpaks? The solution Fedora uses is to layer them on top of the base system. It's all transparent for the end user, but with each new layer, updates take longer and longer. The solution is to enable the system to update itself automatically. I reboot my computer once a week, sometimes more often, other times less often, and the update time has become insignificant for me. The other part of the solution is to remind myself that installing non-flatpak applications is a time consuming process, so I'd rather do it when I can afford the wait.

### Hyprland

For the end user, one major difference between Linux and Windows is that, on the latter, you're stuck with whatever Microsoft throws at you, while on the former you get to decide what the screen looks like. Among Linux users there is a constant debate on the best desktop environment. Some prefer GNOME, others prefer KDE/Plasma, not to mention Budgie and Xfce (and so many others).

And then there are window managers, which are part of the desktop environment. There is an endless list. One particular kind are tiling managers, in which each new window takes all the space available on the screen, generally negotiating space with the other windows. The debate about the best window managers is also endless. At the end of the day, it comes down to: which one do you like the most?

As of the time of this writing, my preference is GNOME on my desktop PC and [Hyprland][hypr] on my laptop. That's what I'm used to.

The problem with [Hyprland][hypr] is that Fedora doesn't have it as an atomic standard, so it must be layered. Knowing that installation and configuration takes significant time, I reserved time for it.

### Bluefin-DX

With or without automatic updates, my workflow requires lots and lots of layers. As part of my work as application developer, software engineer, and systems administrator, I need a number of applications that aren't always available as flatpaks. The overhead is overwhelming. Pun intended. There must be a better way (again)!

I've been following [Jorge Castro](https://www.youtube.com/@JorgeCastro) for a while. Part of his creation is [Universal Blue](https://ublue.it), where they decompose Silverblue and reassemble it using different configurations. They also provide a framework for creating your own custom atomic desktop. Eventually I might get to it.

<mark>Attention: it's not a full blown distro. You don't get to install it. Instead, you install a standard atomic desktop and then rebase it to your creation.</mark>

Meanwhile, I've found [Bluefin-DX][bluefin]. It's custom tailored for application development, coming pre-configured with Visual Studio Code for devcontainers, virtualization tools, development and administration tools, a Jurassic theme that would make my granddaughter happy, and so many other goodies. Beyond flatpak, it also comes with [Homebrew][brew] which, despite a few glitches, works very well.

## 18 December 2024

I have a new laptop: 13th Gen Intel i9-13900H with 32GB RAM. I need to keep Windows on it, but because Linux is also a requirement, I set it up for dual boot. Wherever you look it up, they say atomic desktops are not set up for dual booting. I did find, however, a number of examples of people who were able to make it work, but all my attempts failed. With no viable alternative, I opted for Fedora Workstation. Installation and configuration, as expected, proceeded without issues. I installed the flatpak applications mostly because I'm alreday used to them, and all other ones were installed normally; I don't see a need for [Homebrew][brew]. I obviously installed and configured [Hyprland][hypr].

Once my need for Windows goes away, I might erase it all and proceed to Silverblue (or whatever is hot). I might even install Windows on a virtual machine. Time will tell.

## 4 March 2025

All is going well, but suddenly there's a new Fedora update and my laptop stops <a id="hibernate"></a>hibernating. The main difference is that I was running kernel version 6.12.13-200.fc41.x86_64, which was upgraded to 6.12.15-200.fc41.x86_64. Was there an issue with the upgrade? Did I do anything wrong? Because I have different kernel versions, I kept using the former until a new one becomes available.

And that was 6.13.5-200.fc41.x86_64… and the laptop refuses to hibernate.

### Power saving modes

When you have a desktop computer, you turn it on, run all the programs you need, close them all, and turn the computer off.

Or, if you're like me, leave it running permanently.

On a laptop, you can do the same, but you have a third alternative, usually triggered by closing the lid. Depending on the software you're using or how you've configured it, your computer will stop responding.
* **Sleep**. The computer is running, but all scheduled jobs and alerts are on hold.
* **Suspend**. The computer stops and enters a power saving mode. It uses as little battery as possible, only to ensure the data is preserved.
* **Hibernate**. The computer saves its current status to a swap file or partition on disk and powers itself off. When you turn it back on, it resumes from where you left off.

There are advantages and disadvantages to each. Resuming after sleeping or suspending is quick, but both modes consume battery. Once you run out of power, the computer dies and you must restart from scratch. As for hibernating, it could take several minutes for the computer to save its state and power off, and then a few more to resume, but you can spend hours, days, or as long as you want, and no data is lost.

### The problem

On an average day, I have several programs running simultaneously: an email client (Thunderbird), one or more web browsers, several messengers, video conferencing, different terminals, and other tools. Occasionally I also use Visual Studio Code, either for software development or to maintain this blog, along with more supporting tools. The beauty of modern window managers and desktop environments is that I don't have to clutter my screen; instead, I can (and do) have different programs running in different, independent workspaces. When I turn the computer on, I have to open each program and move it to its workspace, and then I have to close them all before turning off, otherwise I could lose data.

That's one reason I leave my desktop on at all times, but on my laptop that's impractical. The battery may not last until the following day (or week), so for me, hibernation is essential. I know it works well with 6.12.13-200.fc41.x86_64, so when powering up I need to make sure to choose this version.

But it could become an annoyance. I posted a support request on the Fedora Discussion Board, but nobody was able to assist me. Next I raised a Bugzilla issue and am in touch with the Red Hat support team.

### The solution

As of the time of this writing, there is none. It is a known issue, but they have no plans of addressing it and that's the direction they want to go. The workaround is to hang on to 6.12.13-200.fc41.x86_64 for as long as I can.

I wonder if [Arch Linux][arch] still supports hibernation? More to come on this.

## 23 April 2025

I saw [Cody Hou](https://www.codyhou.com/)'s post about [Arch Linux installation](https://www.codyhou.com/arch-encrypt-swap/) and decided to give it another try. Along with other sources I saw online, my goal was to install Arch with BTRFS, encryption, swap, snapshots, Snapper (instead of TimeShift), and dual boot. Did I mention hibernation?

My 12 year old faithful desktop with 4th Gen Intel i7-4770 3.90 GHz and 16GB RAM is too weak for fancy desktop environments. Tiling window managers are great for laptops, but not necessarily for desktops (just my opinion), so I opted for [MATE Desktop][mate]. There's a familiar look and feel to it, which would make it easy for my wife to navigate it when needed, and it performs very well in spite of the heavy burden I lay on it.

### A ghost from the past

As for my laptop, the [problem I had in the past](#past "apps keep crashing") had to do with Dropbox. It uses the system tray for configuration and status indication, but GNOME had disabled it in the past. Extensions like [AppIndicator and KStatusNotifierItem](https://extensions.gnome.org/extension/615/appindicator-support/) fill in the gap… but only to an extent. Particularly with GNOME 48, I had to rely on [Status Icons](https://extensions.gnome.org/extension/7332/status-icons/), but it wasn't good enough either. The computer would crash as soon as Dropbox starts running. With some effort, I could have the computer ressuscitate after the crash, but the indicator was not present. How could I be sure it was running at all? What about alerts?

Fortunately for me, Dropbox ran flawlessly with Hyprland. Same with MATE. Problem solved.

### A ghost from the present

For my professional and volunteer work, I use Zoom with different accounts. Switching between them on Hyprland was making it crash. A solution I found was to replace GNOME with KDE Plasma. Dropbox and Zoom are running perfectly, as well as some of the other critical tools and applications I need. I do miss the Hyprland navigation, but I can switch to it any time without issues.

## 8 May 2025

There is a catchphrase accompanying many Arch Linux users: "I use Arch, by the way." One reason behind it is that installing Arch is no easy task.`ArchInstall` does make it easier, but you still require a lot of knowledge before you can succeed at it. Those of us who were able to break the barrier can claim, "I use Arch, by the way." For the same reason, there is somewhat of a dislike or rejection from those who didn't.

But I digress. I'm not going to justify either side. I'll just say that, for my personal and professional needs, I want a <a id="solid"></a>solid and lean distribution that does what it does very well, and Arch Linux is what got me closer to my needs.

Until last week.

### No login screen after update

It's extremely easy to break a linux system beyond repair. One way is to run `sudo rm -fR /` on a console; this command deletes **all** files on the computer. Another way is to do other things you shouldn't be doing for not knowing what you're up to. There's yet another way, which is to use a distro whose maintainers lack the necessary discipline to ensure their changes don't break anything. That's exactly what I feared when I mentioned [way up there](#aur "AUR can be unstable") about AUR being unstable.

Before venturing into anything new, I first experiment it on my old laptop. Once I can make it work, I do it on the main one. Some time last week I wanted to get a file from the old one and, curiously enough, after turning it on and entering the encryption passphrase, all I got was a blank screen with a flashing cursor. Did I neglect to finish an installation? Did I do something to break it? I don't remember. But that's okay. I'll get the file somehow.

Fast forward a few days, I updated the software on the laptop and restarted it. To my disappointment, but not necessarily a surprise, I got the very same result. This tells me a recent update did break something.

On average, Arch Linux users dedicate their time to debug these problems and help solve them, but not me. I don't have time for it. I need [a solid distribution](#solid "Solid and lean, in this order")!

### I'm done with distro hopping!

What distro gave me the most relief and satisfaction while using it long term? [Fedora Silverblue][fedora], here I come! It doesn't support dual boot, which is a bummer, but there are plenty of ways to run Windows applications on Linux. Worst case scenario, I can spin up a virtual machine and install Windows on it. Layering applications on Silverblue adds plenty of overhead, but fortunately [Bluefin-DX][bluefin] comes with plenty of batteries included that spare me the pain.

Guess who came knocking on my door: the [ghost from the past](#past "ghost from the past")! Fedora 42 comes with GNOME 48.0, which is incompatible with Dropbox. Whatever problems I had with Arch and GNOME are repeating themselves with Fedora, so I'm applying the same solution: switch to KDE Plasma. Fortunately (again), [Aurora DX][aurora] is equivalent to [Bluefin-DX][bluefin], but using KDE Plasma instead.

What about [hibernation](#hibernate "hibernation")? It works to perfection when secure boot is turned off. Security is also a very important factor for me, but I'm trading it off in the interim. My encrypted filesystem will do.

What about my desktop? Oh, well… Backing it up, installing the new OS, and restoring it to operational mode takes a lot of effort. Until it breaks, I'll continue using it.

Indeed, I'm happy to report that my laptop working exactly the way I want it. My desktop will follow soon.r

[alma]: https://almalinux.org/
[arch]: https://archlinux.org/
[arco]: https://arcolinux.com/
[aur]: https://aur.archlinux.org/
[aurora]: https://docs.getaurora.dev/dx/aurora-dx-intro/
[auto]: https://github.com/nwg-piotr/autotiling
[bluefin]: https://projectbluefin.io/
[brew]: https://brew.sh/
[brodie]: https://www.youtube.com/channel/UCld68syR8Wi-GY_n4CaoJGA
[centos]: https://www.servethehome.com/ibm-red-hat-puts-rhel-source-behind-paywall/
[cern]: https://www.businesswire.com/news/home/20230413005066/en/AlmaLinux-to-be-Used-by-CERN-and-Fermilab-in-Groundbreaking-Physics-Experiments
[dbox]: https://distrobox.it/
[debian]: https://www.debian.org/
[distrowatch]: https://distrowatch.com/
[endeavouros]: https://endeavouros.com/
[fastfetch]: https://github.com/fastfetch-cli/fastfetch
[fedora]: https://fedoraproject.org/
[garuda]: https://garudalinux.org/
[guide]: https://www.youtube.com/watch?v=zQQN3Pj4K0Y
[hypr]: https://hyprland.org/
[i3wm]: https://i3wm.org/
[immutable]: https://distrowatch.com/search.php?category=Immutable#simple
[kde]: https://kde.org/
[kubuntu]: https://kubuntu.org/
[manjaro]: https://manjaro.org/
[mate]: https://mate-desktop.org/
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

---

#### Revision history

1. 2024-05-10: Original posting date.
1. 2025-02-06: Issues with an update; upgrading to F41; rebasing to Bluefin-DX; new laptop with dual boot.
1. 2025-02-20: Cosmetic details.
1. 2025-03-04: Fedora is no longer hibernating.
1. 2025-04-23: Arch (by the way).
1. 2025-05-08: Aurora DX.
