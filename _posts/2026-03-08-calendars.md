---
layout: post
title:  "Calendars, calendars, calendars everywhere"
categories: calendars calculations
excerpt_separator: <!--more-->
date: 2026-03-08
last_modified_at: 2026-03-09
---
[![calendars](/assets/images/calendars.png)](/calendars/)
<div style="font-size: 0.8em; text-align: right">Image source: Gemini</div>

This article was initially published on International Women's Day in 2026. That's 8 of March, 2026.

Or is it 19 of Adar I, 5786? Maybe 23 of February, 2026? Perhaps 19 of Ramadan, 1447?

Actually, **all of the above**!
<!--more-->

## In the beginning…

It all started a few months ago, when someone at the synagogue asked what day is Rosh Hashanah, which is the first day of the new year on the Hebrew calendar. Someone answered, "same as always: 1 of Tishrei." This reminded of something I had read years ago on [Calendrical Calculations](https://en.wikipedia.org/wiki/Calendrical_Calculations) by Nachum Dershowitz and Edward M. Reingold. The authors had encountered a similar situation years earlier, when someone asked what day begins Hanukkah (the Jewish festival of lights), someone answered, "same as always: 25 of Kislev," and so they began a study on the different calendars in use nowadays.

All my life I've been celebrating Jewish holidays in different days on the civil calendar. Same with my Muslim friends, who celebrate (among other important events) Ramadan (beginning 18 of February, 2026) and Eid al-Fitr (19 of March, 2026) in different days, and my Indian friends, with their holidays and festivals as well. Recently, I realized my Orthodox friends were not celebrating Christmas on 25 of December, but 7 of January of the following year.

In this article, I'm exploring the different calendars and the methods to convert from one to another. In parallel, I'm building an Elixir library ([source on Codeberg](https://codeberg.org/taflaj/calendars)).

## A multitude of calendars

Most of which are still in use.

### Julian calendar

The [Julian calendar](https://en.wikipedia.org/wiki/Julian_calendar) was proposed by Julius Caesar himself (hence the name) and took effect on 1 of January, 45 bCE, having prevailed for more than 1,600 years in the Roman Empire and most of the Western world. Because each year is approximately 365¼ days long, there are 3 years with 365 days and one with 366, for which an extra day in February is added.

But there is a problem: the year is *approximately* 365¼ days long, but not **precisely**. Actually, it's a bit shorter than that. Science doesn't care for our preconceptions and continues to do its thing. With time, people began to realize the seasons were changing when they were not expected, just like the lengths of days and nights.

### Gregorian calendar

To address this discrepancy, Pope Gregory XIII promulgated [a new calendar](https://en.wikipedia.org/wiki/Gregorian_calendar), which is adopted as the civil calendar by most countries. The main motivation was that the March equinox was occurring much earlier than March 21, which is necessary for calculating the date of Easter. To correct it, Thursday, 4 of October, 1582 was followed by Friday, **15** of October, 1582.

The Gregorian calendar follows the same principles as the Julian calendar, with a difference: to be considered a leap year, not only the year must be divisible by 4, but also by 400 and not by 100. For example: 1600 was a leap year; 1700, 1800, and 1900 were not; 2000 was; 2100 will not. Please remind your grandchildren to inform their children.

From 1901 through 2099, the Julian calendar is 13 days behind the Gregorian calendar.

## In the end…

Some people say, "it's 5 o'clock somewhere" as an excuse to drink wine any time. I'm sure there exist more calendars than I'm accounting for, which means it must be my birthday somewhere. I'll have some cake.

---

#### Revision history

1. 2026-03-08: Original posting date.
2. 2026-03-09: Julian and Gregorian calendars.

Note: all dates are on the Gregorian calendar.

---
