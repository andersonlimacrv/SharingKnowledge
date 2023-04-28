### ExceptionWithResponse vs RequestFailed

~~~html
In the rest_client gem, ExceptionWithResponse and RequestFailed are both exception classes that can be raised when an HTTP request fails.

The main difference between the two classes is that ExceptionWithResponse is a generic exception class that is raised for any kind of HTTP error response, while RequestFailed is a more specific subclass of ExceptionWithResponse that is raised when an HTTP request fails with a status code that is not handled by the code.

In other words, if you use rescue ExceptionWithResponse in your code, it will catch all exceptions that inherit from ExceptionWithResponse, including RequestFailed. However, if you specifically want to handle cases where an HTTP request fails with a status code that is not handled by the code, you can use rescue RequestFailed instead.

Here's an example of how you might use these exception classes in your code:
~~~

~~~ruby
require 'rest-client'

begin
  # Make an HTTP request
  response = RestClient.get('http://example.com')
rescue RequestFailed => e
  # Handle the case where the request failed with an unhandled status code
  puts "Request failed with status #{e.http_code}: #{e.response}"
rescue ExceptionWithResponse => e
  # Handle all other cases where an HTTP error response was received
  puts "HTTP error response: #{e.response}"
rescue RestClient::Exception => e
  # Handle all other cases where a RestClient exception was raised
  puts "RestClient exception: #{e.message}"
end
~~~

~~~html
In this example, if the HTTP request fails with a status code that is not handled by the code, the RequestFailed exception will be raised and the first rescue block will be executed. If the HTTP request fails with a different kind of error response, the second rescue block will be executed. If a different kind of RestClient exception is raised, the third rescue block will be executed.
~~~

### example about RequestFailed exception which can not catch
- Here's an example where even though we rescue with RequestFailed, we are not able to catch the exception:

~~~ruby
require 'rest-client'

begin
  # Make an HTTP request that will fail with a 404 Not Found error
  response = RestClient.get('http://example.com/404')
rescue RequestFailed => e
  puts "Caught RequestFailed exception: #{e.message}"
end

puts "Code continues to execute after the rescue block"
~~~

~~~html
In this example, the code attempts to make an HTTP GET request to a URL that will return a 404 Not Found error. Since this error code is not handled by the code, a RequestFailed exception will be raised. However, the rescue block that follows attempts to catch the RequestFailed exception and print a message.

Despite the rescue block being in place, the exception is not caught and the program terminates with the following error message:

/usr/local/lib/ruby/gems/3.1.0/gems/rest-client-2.1.0/lib/restclient/abstract_response.rb:274:in `exception_with_response': 404 Resource Not Found (RestClient::NotFound) ...


This happens because RequestFailed is a subclass of RestClient::Exception, which is a different class hierarchy than the one used by Ruby's built-in StandardError hierarchy. Since RequestFailed is not a subclass of StandardError, it cannot be caught by a generic rescue block that catches all StandardError exceptions.

To catch a RequestFailed exception, you need to explicitly rescue it with a rescue block that specifies RequestFailed as the exception class, as shown in the previous example.
~~~

### example about RequestFailed exception which can be used

~~~ruby
require 'rest-client'
require 'json'

def process_response(response)
  JSON.parse(response.body)
end

begin
  # Make an HTTP request using RestClient
  response = RestClient.get('http://example.com/api/v1/data')

  # Process the response
  data = process_response(response)

rescue RequestFailed => e
  # Handle the RequestFailed exception by logging the error
  puts "Request failed with status code #{e.http_code}: #{e.message}"
  puts "Response body: #{e.response.body}"
  # Notify the user that the request failed and suggest next steps
  puts "Sorry, we were unable to retrieve the data. Please try again later."
end
~~~

### example there could be cases where you can't rescue the RequestFailed exception even if you have a custom process_response method.

~~~html
For example, let's say you have a service that is running behind a firewall that blocks requests to certain URLs. In this case, when you make a request to one of the blocked URLs, you may receive a network-level error (such as a timeout) instead of an HTTP error code that can be caught by RequestFailed. In this scenario, you would need to rescue a more generic exception class such as StandardError or Net::OpenTimeout.

Here's an example of how you could handle a network-level error using rescue with StandardError:
~~~
