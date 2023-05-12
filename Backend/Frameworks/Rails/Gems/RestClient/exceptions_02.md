~~~ruby
require 'rest-client'

begin
  response = RestClient.get('https://example.com/some_resource')
rescue RestClient::ExceptionWithResponse => e
  puts "An exception with response occurred: #{e.message}"
  puts "HTTP status code: #{e.http_code}"
  puts "Response headers: #{e.http_headers}"
  puts "Response body: #{e.http_body}"
rescue RestClient::RequestFailed => e
  puts "The request failed with an unmanaged error code: #{e.message}"
  puts "HTTP status code: #{e.http_code}"
  puts "Response headers: #{e.http_headers}"
  puts "Response body: #{e.http_body}"
end
~~~

~~~html
- RestClient::ExceptionWithResponse is used to handle HTTP errors that include a response from the server. This means that the server has returned an HTTP status code that indicates an error (e.g., 4xx or 5xx), along with a response body and headers. This exception allows you to access the HTTP error code, the response headers, and the response body to better understand the cause of the error.

- RestClient::RequestFailed is used to handle cases where the request fails without a response from the server. This could be due to issues like network connectivity problems, timeouts, or other unmanaged errors. This exception also provides access to the HTTP error code, response headers, and response body, but these values might not be available or meaningful in this context, as there might not be an actual server response.

- In summary, use RestClient::ExceptionWithResponse to handle errors that include a server response, and use RestClient::RequestFailed to handle errors that occur without a server response. By handling these exceptions separately, you can provide more accurate error messages and take appropriate action based on the type of error encountered.
~~~


### how about rescue only `RestClient::RequestFailed`

~~~ruby
require 'rest-client'

begin
  response = RestClient.get('https://example.com/some_resource')
rescue RestClient::RequestFailed => e
  puts "The request failed with an unmanaged error code: #{e.message}"
  puts "HTTP status code: #{e.http_code}"
  puts "Response headers: #{e.http_headers}"
  puts "Response body: #{e.http_body}"
end

=begin
If you only rescue RestClient::RequestFailed, you would miss other types of exceptions that inherit from RestClient::ExceptionWithResponse. However, if you specifically want to handle RestClient::RequestFailed, you can rescue it separately.
=end

=begin
### example

require 'rest-client'

begin
  response = RestClient.get('https://example.com/some_resource')
rescue RestClient::RequestFailed => e
  puts "The request failed with an unmanaged error code: #{e.message}"
  puts "HTTP status code: #{e.http_code}"
  puts "Response headers: #{e.http_headers}"
  puts "Response body: #{e.http_body}"
end

Keep in mind that by doing this, you won't be handling other exceptions that inherit from RestClient::ExceptionWithResponse. If you want to handle other exceptions as well, you can add more rescue blocks for specific exception classes or rescue RestClient::ExceptionWithResponse alongside RestClient::RequestFailed.
=end
~~~
