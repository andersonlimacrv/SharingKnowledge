### communication protocols between clients and servers
```html
  1. Ajax polling
  2. HTTP Long-polling
  3. Websockets
  4. Server-sent Events
  5. Comect
```

~~~html
1. Ajax Polling: the client repeatedly polls the server for data, which generates a lot of empty responses and creates HTTP overhead.
2. HTTP Long-Polling: the server holds the request and waits until some data becomes available, which reduces HTTP overhead and latency.
3. WebSockets: it provides a persistent connection between a client and a server that both parties can use to start sending data at any time, which facilitates real-time data transfer from and to the server.
4. Server-Sent Events (SSEs): the server establishes a persistent and long-term connection with the client, which is best when we need real-time traffic from the server to the client.
~~~

[info](https://www.educative.io/courses/grokking-the-system-design-interview/gx7wZzWn5Vj)
