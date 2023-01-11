### Date, Time, and DateTime

- Time is built-in to Ruby
- Date and DateTime come from the standard library date


### noted

- DateTime is considered deprecated. It only still exists to be backwards-compatible.
- As of Ruby 3 (released December 24th, 2020, as is Ruby tradition),
DateTime only exists for backwards-compatibility. The date library docs recommend you
just use Time instead


### should use Time or Date?

- The biggest difference between Date and Time is that
	+ Date is concerned with days and above;
	+ if you care at all about hours, minutes, seconds and below, or think you might care about them in the future, you have to use Time. Date can’t handle any of that.

- On the other hand, here are some things Date can do better than Time:
	+ Handle history
	+ Be configured to accept dates in different formats
	+ Make customized calendar decisions

- Time chứa thông tin về Date nhưng Date không chứa thông tin về Time

```ruby
>> Date.current
=> Tue, 12 Apr 2022
>> Time.current
=> Tue, 12 Apr 2022 12:29:55 AEST +10:00
```

[source](https://medium.com/swlh/should-i-use-date-time-or-datetime-in-ruby-and-rails-9372ad20ca4f)
