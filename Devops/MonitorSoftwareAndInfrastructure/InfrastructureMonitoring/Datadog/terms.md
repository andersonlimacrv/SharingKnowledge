### P50 latency (50th percentile latency)
50% of the requests will be faster than the p50 value

- example:
~~~html
Let’s take an example to simplify this further.

Say we have the following latencies in milliseconds:
50, 78, 25, 90, 102, 68.

Now arrange them in ascending order, and you get.
25, 50, 68, 78, 90, 102.

the p50 latency for this will be the next latency after skipping the first 50% of data i.e. 78.
Similarly, p90 = 102.
~~~

### P90 latency (90th percentile latency)
- 90% of the requests will be faster than the p90 value
- The p90 latency is the highest latency value (slowest response)

~~~html
p50, p90, pxy are metrics to measure the latency of your services.
The number here denotes the percentile of total requests.
~~~

### latency

~~~html
latency is the interval between two points in time. you measure the start time and the end time of an event, and you want to know how long it took.
~~~

### significant

~~~html
The lower the values of these metrics the better your service is performing.
The order of precedence for these will be in descending order i.e. p99, p90, p50.
So the lower the values of p99, p90 the better your service / APIs are.
~~~

[source](https://igor.io/latency/)
[source](https://readosapien.com/what-is-p50-p90-p99-latency/#:~:text=p50%2C%20p90%2C%20pxy%20are%20metrics,faster%20than%20the%20p90%20value.)

### powerpack
Powerpacks are templated groups of dashboard widgets you can save from an existing dashboard and turn into reusable packs in the widget tray.
