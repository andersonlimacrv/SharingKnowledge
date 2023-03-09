### sinatra console

~~~bash
 irb -r ./app.rb
~~~

~~~html
1. halt is a method that stops the processing of a request and immediately returns a response to the client.
The halt method takes an HTTP status code and an optional message as parameters.
For example, halt 404, "Page not found" would immediately return a "404 Page not found" response to the client.
~~~

~~~html
1. pass: This method stops the current route's processing and allows the next matching route to handle the request instead.

2. redirect: This method redirects the client to a different URL, either with a temporary or permanent redirect.

3. error: This method is similar to halt, but is specifically for handling errors in the application. It allows you to provide a custom error page or message.

4. halt!: This method is similar to halt, but raises a Sinatra::Halt exception instead of returning a response. This can be useful in some situations where you need to catch the exception and handle it differently.

5. pass!: This method is similar to pass, but raises a Sinatra::Pass exception instead of simply stopping the processing of the current route. This can be useful in situations where you need to catch the exception and handle it differently.
~~~
