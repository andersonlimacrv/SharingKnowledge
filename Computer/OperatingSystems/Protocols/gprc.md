- gRPC = Remote Procedure Calls
[source](https://200lab.io/blog/grpc-la-gi-vu-khi-tang-tai-microservices/)

### 4 types of API in gPRC
1. Unary
2. Server streaming
3. Client streaming
4. Bi directional streaming


### example
```html
service GreetService {
	// unary
	rpc Greet(GreetRequest) returns (GreetRespones) {};

	// streaming server
	rpc GreetManyTimes(GreetManyTimesRequest) returns (stream GreetManyTimesResponse) {};

	// streaming client
	rpc LongGreet(stream LongGreetRequest) returns (LongGreetResponse) {};

	// bi directional streaming
	rpc GreetEveryone(stream GreetEveryoneRequest) returns (stream GreetEveryoneResponse) {};
}
```

### tutorials
[tut01](https://scotch.io/tutorials/implementing-remote-procedure-calls-with-grpc-and-protocol-buffers)
[tut02](https://docs.servicestack.net/grpc-ruby)
[tut03](http://leohetsch.com/using-protocol-buffers-in-your-apis/)