https://ghz.sh/


### how to use ghz
https://speakerdeck.com/kenju/the-guide-to-load-test-grpc-application?slide=12


### question on how to use it

~~~html
hi team,

I am trying to benchmark the unary and server stream API in gRPC for my current API to get member details
which has a large number of fields in response.

Currently, this API is using unary API and I would like to improve it with server stream  API.
I started to work around with ghz (https://ghz.sh/)

ghz --insecure --proto ~/Documents/WorkSpace/EH/grpc_proto/protos/employment_hero.proto --call EhProtobuf.EmploymentHero.GetMemberDetails localhost:50050

and expected it will return the benchmark figures will happen, but instead

`cannot find service "EhProtobuf.EmploymentHero"`

Could this be because I am not installing those gems in local
  gem 'eh_protobuf', '1.12.230'
  gem 'eh_protobuf_core', '~> 2.6.7'

Would someone have any recommendations or do we have another tool before? :pray:

>
ghz --call="EhProtobuf.EmploymentHero.RpcServer.GetUser" --proto=employment_hero.proto --insecure --total=1 --rps=20 --timeout=1s  --connections=4 localhost:50050 --data="{\"id\":\"d894936d-8cfa-4dbd-a52d-e49165762c6d\"}" --count-errors
Here is what I did last time, you can do a quick comparison to figure out what is going wrong with your command.


>
Your call param lacks the RpcServer namespace. It should be EhProtobuf.EmploymentHero.RpcServer.GetMemberDetails instead.
~~~

### debugging with ghz to identify which type of gRPC is calling such as unary or server stream

ghz --insecure --proto ~/Documents/WorkSpace/EH/grpc_proto/protos/employment_hero.proto --call EhProtobuf.EmploymentHero.RpcServer.GetMemberDetails localhost:50050 --data="{\"member_id\":\"541b33bf-83f8-42cb-b4f5-f308d78467b9\"}" --debug ~/Desktop/logs/debug.json

> take a look the output here for `call type`

```ruby
{"level":"debug","time":"2023-03-07T14:51:51.078515+07:00","message":"Making request","workerID":"g37c0","call type":"server-streaming"
```
