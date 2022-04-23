### In a Rails app, we have three different time zones:

- system time
- application time, and
- database time

```ruby
# This is the time on my machine, also commonly described as "system time"
> Time.now
=> 2015-07-04 17:53:23 -0400

# Let's set the time zone to be Fiji
> Time.zone = "Fiji"
=> "Fiji"

# But we still get my system time
> Time.now
=> 2015-07-04 17:53:37 -0400

# However, if we use `zone` first, we finally get the current time in Fiji
> Time.zone.now
=> Sun, 05 Jul 2015 09:53:42 FJT +12:00

# We can also use `current` to get the same
> Time.current
=> Sun, 05 Jul 2015 09:54:17 FJT +12:00

# Or even translate the system time to application time with `in_time_zone`
> Time.now.in_time_zone
=> Sun, 05 Jul 2015 09:56:57 FJT +12:00

# Let's do the same with Date (we are still in Fiji time, remember?)
# This again is the date on my machine, system date
> Date.today
=> Sat, 04 Jul 2015

# But going through `zone` again, and we are back to application time
> Time.zone.today
=> Sun, 05 Jul 2015

# And gives us the correct tomorrow according to our application's time zone
> Time.zone.tomorrow
=> Mon, 06 Jul 2015

# Going through Rails' helpers, we get the correct tomorrow as well
> 1.day.from_now
=> Mon, 06 Jul 2015 10:00:56 FJT +12:00
```

### see all the available time zones

```ruby
rake time:zones:all
```

### check current time zone

```ruby
> Time.zone
=> #<ActiveSupport::TimeZone:0x007fbf46947b38
 @current_period=#<TZInfo::TimezonePeriod: nil,nil,#<TZInfo::TimezoneOffset: 0,0,UTC>>>,
 @name="UTC",
 @tzinfo=#<TZInfo::TimezoneProxy: Etc/UTC>,
 @utc_offset=nil>
```

[source](https://thoughtbot.com/blog/its-about-time-zones#three-time-zones)
