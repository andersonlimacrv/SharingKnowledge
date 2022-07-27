[web-authentication-methods](https://testdriven.io/blog/web-authentication-methods/)


### Authentication vs Authorization
1. Authentication: Who are you?
2. Authorization: What can you do?


1. HTTP Basic Authentication
2. HTTP Digest Authentication
3. Session-based Auth
	- cons:
		+ It's stateful. The server keeps track of each session on the server-side. The session store, used for storing user session information, needs to be shared across multiple services to enable authentication. Because of this, it doesn't work well for RESTful services, since REST is a stateless protocol.
		+ Cookies are sent with every request, even if it does not require authentication
		+ Vulnerable to CSRF attacks.
4. Token-Based Authentication
  - the most common used token is a JSON Web Token
  - A JWT consists of three parts:
    + Header (includes the token type and the hashing algorithm used)
    + Payload (includes the claims, which are statements about the subject)
    + Signature (used to verify that the message wasn't changed along the way)

  - pros:
    + It's stateless. The server doesn't need to store the token as it can be validated using the signature. This makes the request faster as a database lookup is not required.
    + Suited for a microservices architecture, where multiple services require authentication. All we need to configure at each end is how to handle the token and the token secret.
5. One Time Passwords
6. OAuth and OpenID
