[time zone](https://everytimezone.com/)
[timeanddate](https://www.timeanddate.com/time/map/)


### UTC (Coordinated Universal Time)
- Giờ quốc tế
- Chuẩn quốc tế về ngày giờ dựa trên phương pháp nguyên tử.
- Trước khi giờ UTC ra đời thì giờ chuẩn Greenwich (GMT) là tiêu chuẩn chung cho toàn thế giới
- Hướng dẫn cách viết giờ UTC:

```html
	GIờ UTC được viết bằng bốn chữ số sau:

	Hai số chỉ giờ từ 00 tới 23
	Hai số chỉ phút từ 00 tới 59
	Không có dấu giữa các số này. Ví dụ 3 giờ 8 phút chiều được viết là 1508.
```

```html
UTC is a global time standard.
It defined how time will be measured and coordinated between everybody.
But UTC is also used as a successor of GMT (=Greenwich Mean Time) to describe the time at the 0° meridian.

In code, we usually denote it with +00:00 or with a Z.
The letter Z is used for historical reasons because Z was the name of the timezone using this time.
This time is also sometimes called the Zulu time since NATO’s phonetic alphabet for Z is “Zulu”.
```

### GMT (Greenwich Mean Time)


### What Is The ISO Format / ISO 8601 Format
- This ISO standard defines how to format dates and date-times without confusion and misunderstandings.

~~~html

1. Date format:
- 2020-10-26

2. Date and time formats:
- 2020-10-26T08:15:30+02:00
- 2020-10-26T08:15:30Z
- 20201026T081530Z
- 2020-10-26T08:15:30.456+02:00 <- with microseconds

If the timezone is omitted, the datetime is usually interpreted to be recording the locale time.
But of course, this is up to every programming team to define for themselves.

The T is also often omitted. The ISO standard does allow for this, but only if the 2 parties communicating with such dates have agreed to allow it. However, there is no mention of substituting T with a space. But I think we all see that our community has decided that it can correctly understand a datetime with a space and is actively using it everywhere.
~~~


### UTC/GMT vs ISO 8601

~~~html
UTC & GMT are time-keeping, not formats
~~~

~~~html
1. ISO 8601

The format seen in your first example 2019-11-14T00:55:31.820Z is defined by the ISO 8601 standard.
The T in the middle separates the year-month-day portion from the hour-minute-second portion.
The Z on the end means UTC, that is, an offset-from-UTC of zero hours-minutes-seconds. The Z is pronounced "Zulu" per military/aviation tradition.
The ISO 8601 standard is more modern. The formats are wisely designed to be easy to parse by machine as well as easy to read by humans across cultures.

Always choose ISO 8601 when serializing date-time values as text.
~~~

### UTC vs timezone
example:

~~~html
<!-- vidu ve hom nay vao luc 08:29 gio VNT -->
Long Thạnh Mỹ, District 9, Ho Chi Minh City is 7 hours ahead of Coordinated Universal Time

01:29 Tuesday, in Coordinated Universal Time is
08:29 Tuesday, Long Thạnh Mỹ, District 9, Ho Chi Minh City (GMT+7)

<!-- Greenwich Mean Time (GMT) is often interchanged or confused with Coordinated Universal Time (UTC). But GMT is a time zone and UTC is a time standard. -->
~~~

