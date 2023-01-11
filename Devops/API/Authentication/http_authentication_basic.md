~~~html
HTTP Basic Authentication is a simple authentication scheme built into the HTTP protocol. It involves sending an HTTP header called Authorization with a value consisting of the word Basic, followed by a space and a base64-encoded string username:password.
~~~

- Here is an example of a request that uses HTTP Basic Authentication:

~~~ruby
GET /protected_resource HTTP/1.1
Host: example.com
Authorization: Basic ZGFtOmJhc2ljLXBhc3N3b3Jk
~~~

~~~html
In this example, the username is dam and the password is basic-password. The string dam:basic-password is base64-encoded to produce the value ZGFtOmJhc2ljLXBhc3N3b3Jk, which is then included in the Authorization header.

On the server side, the server can decode the base64-encoded value and check the provided username and password against some authentication database to determine whether the client should be allowed access to the protected resource.

HTTP Basic Authentication is not very secure on its own, since the username and password are transmitted in plain text (base64-encoded, but easily decodable) with every request. It is usually used in conjunction with HTTPS to encrypt the transmitted data and provide additional security.
~~~


### flow
~~~html
1. Unauthenticated client requests a restricted resource
2. HTTP 401 Unauthorized is returned with a header WWW-Authenticate that has a value of Basic.
3. The WWW-Authenticate: Basic header causes the browser to display the username and password promot
4. After entering your credentials, they are sent in the header with each request: Authorization: Basic dcdvcmQ=
~~~

### Pros
~~~html
1. Since there aren't many operations going on, authentication can be faster with this method.
2. Easy to implement.
3. Supported by all major browsers.
~~~

### Cons
~~~html
1. Base64 is not the same as encryption. It's just another way to represent data. The base64 encoded string can easily be decoded since it's sent in plain text. This poor security feature calls for many types of attacks. Because of this, HTTPS/SSL is absolutely essential.
2. Credentials must be sent with every request.
3. User can only be logged out by rewriting the credentials with an invalid one.
~~~
