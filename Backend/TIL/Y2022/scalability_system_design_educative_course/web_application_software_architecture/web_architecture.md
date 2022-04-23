### what is web architecture
- web architecture involves multiple components like a
db, msg queue, cache, user interface ..., all running
in conjunction to form an online service

#### client-server architecture
- the architecture works on a request-response model

1. client

		- client hold our user interface
		- it written in html, javascript, css

	1.1. types of clients

		- thin client
			+ just hold a user interface of application
			+ it contains no biz logic of any sort
		- thick client (fat clien)
		 	+ hold all or some part of the biz logic
		 	+ ex: utility app, online games, ...


2. server

- what is server?
	+ the primary task of a web server is to receive the requests from the client and provide the response after executing the business logic based on the request parameters received from the client.
	+ every online service needs a server to run. Servers running web applications are commonly
	known as application servers
	+ besides the application servers, there are also other kinds of servers with specific tasks assigned. These include:
		+ proxy server
		+ mail server
		+ file server
		+ virtual server
		+ data storage server
		+ batch job server and so on


3. commnication btw client and server

	3.1. request and response model

		- the client and server have a request-response model. The client sends the request
		and server responds with data
		- if there is no request, there is no response

	3.2. http protocol

		- The entire communication happens over the HTTP protocol.
		It is the protocol for data exchange over the World Wide Web.
		HTTP protocol is a request-response protocol that defines how
		information is transmitted across the web.

		- It’s a stateless protocol, and every process over HTTP is executed independently
		and has no knowledge of previous processes.

	3.3. REST API and API Endpoints

		- The backend application code has a REST-API implemented.
		This acts as an interface to the outside world requests.
		Every request, be it from the client written by the business or
		the third-party developers, those who consume our API data have to h
		it the REST endpoints to fetch the data.

