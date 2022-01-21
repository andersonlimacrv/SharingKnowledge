```ruby
queues = Sidekiq::Queue.all
queues.each do |queue|
  queue.each do |job|
    p job.klass, job.args, job.jid
  end
end
```
