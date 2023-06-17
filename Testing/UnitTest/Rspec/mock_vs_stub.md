### stub

```html
- A stub is only a method with a canned response, it doesn’t care about behavior.
- Returns canned responses, avoiding any meaningful computation or I/O

- A canned response in the context of testing and programming refers to a pre-determined or fixed response that is provided by a stub when a certain method or request is called. It is a way to simulate the behavior of a real object or service without actually invoking it.
```

```ruby
allow(some_object).to receive(some_method).and_return(some_value)
```

### mock

```html
- A mock expects methods to be called, if they are not called the test will fail.
- Expects specific messages; will raise an error if it doesn’t receive
  them by the end of the example

### another definition:
- Mocking is the practice of using fake objects to mimic the behaviour of
real application components. Since mock objects simulate the behaviour of
the original components, they can be used during testing of an isolated
application code to handle its interaction with other parts of the application.

[source](https://www.netguru.com/blog/ruby-tests-rspec-mocks)

### benefits:
- The simplification of the test environment building process
- Minimizing time and resource footprint.

### mocking object types:
1. stub: returns pre-programmed results in response to specific messages
2. mock: has built-in expectations of messages that it will receive and
  it will fail if those expectations are not fulfilled.
3. null object:  returns self in response to any message.
4. spy: registers all messages
5. fake: a simplified version of an object that operates correctly
  in development but is unsuitable for production, e.g. an SQLite database.
6. dummy: an object that is passed around but is never used.
```

```ruby
expect(some_object).to receive(some_method).and_return(some_value)
```

```html
  Mock test là khái niệm dùng để chỉ rằng, thay vì lấy data từ một real
  service, bạn sử dụng một bộ test data mà input và output của bạn được
  định nghĩa rõ ràng từ một service giả khác (mock) và bạn dùng nó như
  là input cho cái system mà bạn muốn test
```

[stub vs mock](https://viblo.asia/p/rspec-su-khac-biet-giua-mocks-va-stubs-3P0lPkNnZox)
