```html
1. what is tier
  - tier is not a code level, it is a component level (database, backend server, UI, caching server...)
2. why do software application have different tiers?
3. how do I decide how many tiers my application should have?
```

### 1. Single tier applications
- in a single tier application, the UI, backend logic, and db reside
in the same machine

#### upsides
- no network latency since every component is located in the same machine

#### downsides


### 2. Two tier applications
- a two tier application involves a client and server.
The client contains the user interface with the biz logic
in one machine. Meanwhile, the backend server includes the db
running on a different machine


### 3. Three tier applications
- in a three tier application, the user interface, biz logic, and the
db all reside on different machine and, thus, have different tiers


### 4. N-tier applications
- an n-tier application is an application that has more than 3 components
(user interface, backend server, db) involved in its architecture.

- what are those components?
 + cache
 + message queue for asynchronous behavior
 + load balancer
 + search servers for searching through massive amounts of data
 + components involved in processing massive amounts of data
 + components running heterogeneous tech commonly known as web services, microservices, etc.


