### should to use

```ruby
2.hours.ago # => Thu, 27 Aug 2015 14:39:36 AFT +04:30
1.day.from_now # => Fri, 28 Aug 2015 16:39:36 AFT +04:30
Time.zone.parse("2015-08-27T12:09:36Z") # => Thu, 27 Aug 2015 16:39:36 AFT +04:30
Time.current # => Thu, 27 Aug 2015 16:39:36 AFT +04:30
Time.current.utc.iso8601 # When supliyng an API ("2015-08-27T12:09:36Z")
Time.strptime("2015-08-27T12:09:36Z", "%Y-%m-%dT%H:%M:%S%z").in_time_zone # If you can’t use Time.zone.parse (Thu, 27 Aug 2015 16:39:36 AFT +04:30)
Date.current # If you really can’t have a Time or DateTime for some reason (Thu, 27 Aug 2015)
Date.current.in_time_zone # If you have a date and want to make the best out of it (Thu, 27 Aug 2015 00:00:00 AFT +04:30)
````


### should not

```ruby
Time.now # Returns system time and ignores your configured time zone. (2015-08-27 14:09:36 +0200)
Time.parse("2015-08-27T12:09:36Z") # Will assume time string given is in the system’s time zone. (2015-08-27 12:09:36 UTC)
Time.strptime("2015-08-27T12:09:36Z", "%Y-%m-%dT%H:%M:%S%z") # Same problem as with Time.parse. (2015-08-27 12:09:36 UTC)
Date.today # This could be yesterday or tomorrow depending on the machine’s time zone, see https://github.com/ramhoj/time-zone-article/issues/1 for more info. (Thu, 27 Aug 2015)
```

[source](https://viblo.asia/p/time-zones-trong-ruby-on-rails-PwRGgVyKvEd)
