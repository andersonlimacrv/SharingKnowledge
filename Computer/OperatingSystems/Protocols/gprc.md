### gRPC(Remote Procedure Calls)
[source](https://200lab.io/blog/grpc-la-gi-vu-khi-tang-tai-microservices/)
[source](https://viblo.asia/p/grpc-grpc-server-streaming-WAyK8BENlxX)

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

### what is streaming server

```html
Client sẽ gửi một request đến Server và nhận về nhiều response từ Server.
Sau khi Server đã gửi tất cả các response cho Client,
Server sẽ gửi thông báo đến Client nó đã hoàn thành nhiệm vụ.
```
- example:

```html
case study ví dụ như chức năng đặt taxi trên ứng dụng Uber
trong đó khách hàng yêu cầu đặt một taxi, sau đó Uber
có thể sẽ gửi nhiều phản hồi về cho khách hàng thông tin
tài xế là ai, tài xế ở đâu, tài xế sẽ mất bao lâu để đón khách hàng.
```


### tutorials
[tut01](https://scotch.io/tutorials/implementing-remote-procedure-calls-with-grpc-and-protocol-buffers)
[tut02](https://docs.servicestack.net/grpc-ruby)
[tut03](http://leohetsch.com/using-protocol-buffers-in-your-apis/)
