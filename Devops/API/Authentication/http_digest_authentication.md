~~~html
HTTP Digest Authentication is another authentication scheme built into the HTTP protocol.
It is similar to Basic Authentication, but is designed to be more secure by using a digest hash of the password instead of sending the password in plain text.
~~~

- Here is an example of a request that uses HTTP Digest Authentication:

~~~ruby
GET /protected_resource HTTP/1.1
Host: example.com
Authorization: Digest username="dam", realm="example", nonce="dcd98b7102dd2f0e8b11d0f600bfb0c093", uri="/protected_resource", response="b967c4d4f4e7dcece9885d3b5b3d3e3a"
~~~

~~~html
In this example, the Authorization header includes several parameters:

- username: The username of the client.
- realm: A string that identifies the protection space.
- nonce: A server-specified value that the client must include in the request to prove that it received the nonce value from the server.
- uri: The requested resource.
- response: A digest hash of the password and other information, used to authenticate the client.
On the server side, the server can check the response value against a stored hash of the password to determine whether the client should be allowed access to the protected resource.

To use HTTP Digest Authentication in a Ruby application, you can use the rack-auth-digest gem. Here is an example of how to use it:
~~~

~~~ruby
require 'rack/auth/digest/md5'

use Rack::Auth::Digest::MD5 do |username|
  # Look up the user's password hash in the database
  User.find_by(username: username).try(:password_hash)
end

# Require authentication for all routes
before do
  request.env['HTTP_AUTHORIZATION'] ||= Rack::Auth::Digest::MD5.auth_header(request, 'example')
  halt 401 unless authenticated?
end

# Your routes go here
get '/protected_resource' do
  # The user is authenticated, so the route code can run
  'Protected resource'
end
~~~

~~~html
This code installs a Rack middleware that handles the HTTP Digest Authentication process, and requires authentication for all routes by checking the HTTP_AUTHORIZATION environment variable. If the user is not authenticated, they will receive a 401 Unauthorized response.
~~~


### flow
~~~html
1. Unauthenticated client requests a restricted resource
2. Server generates a random value called a nonce and sends back an HTTP 401 Unauthorized status
with a WWW-Authenticate header that has a value of Digest along with the nonce: WWW-Authenticate: Digest nonce="44f0437004157342f50f935906ad46fc"
3. The WWW-Authenticate: Basic header causes the browser to display the username and password prompt
4. After entering your credentials, the password is hashed and then sent in the header along with the nonce with each request: Authorization: Digest username="username", nonce="16e30069e45a7f47b4e2606aeeb7ab62", response="89549b93e13d438cd0946c6d93321c52"
5. With the username, the server obtains the password, hashes it along with the nonce, and then verifies that the hashes are the same
~~~

### pros
- More secure than Basic auth since the password is not sent in plain text.
- Easy to implement.
- Supported by all major browsers.

### cons
- Credentials must be sent with every request.
- User can only be logged out by rewriting the credentials with an invalid one.
- Compared to Basic auth, passwords are less secure on the server since bcrypt can't be used.
- Vulnerable to man-in-the-middle attacks.
