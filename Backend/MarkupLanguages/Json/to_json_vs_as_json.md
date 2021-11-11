```ruby
> { :name => "Konata Izumi", 'age' => 16, 1 => 2 }.to_json
"{\"name\":\"Konata Izumi\",\"age\":16,\"1\":2}"

> { :name => "Konata Izumi", 'age' => 16, 1 => 2 }.as_json
{"name"=>"Konata Izumi", "age"=>16, "1"=>2}
```
