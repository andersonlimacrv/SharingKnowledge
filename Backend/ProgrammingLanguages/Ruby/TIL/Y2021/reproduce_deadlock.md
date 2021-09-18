# dk xay ra deadlock: 2 transaction chay dong thoi, update tren cung mot
tap resource voi thu tu khac nhau

1. in transaction
2. run concurrency
3. update on a same set of resources
4. the set of resources are diffrent order


```ruby
module Sample
	class DeadlockDemo
		def self.method_a(resources)
			ActiveRecord::Base.transaction do
				resources.each do |r|
					r.update(active: true)
					byebug
				end
			end
		end
	end
end
```

```html
Demo cho ai muốn tái hiện lại cái DB deadlock
Nhớ mở 2 cái console session chạy 2 lần updates 
với 2 tập members khác order nhau là được
```