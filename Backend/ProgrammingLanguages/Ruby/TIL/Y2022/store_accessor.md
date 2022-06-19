[use store_accessor](https://tirdadc.github.io/blog/2016/11/03/practical-use-of-jsonb-attributes-in-ruby-on-rails-forms/)


```ruby
class AddWebsitesToUser < ActiveRecord::Migration
  def change
    add_column :users, :websites, :jsonb, default: '{}'
    add_index  :users, :websites, using: :gin
  end
end
```

Now you can set whatever data you want inside of that field using keys:

```ruby
user.websites['primary_website'] = 'http://www.example.com'
````

Using a store accessor allows you to specify the keys you want to access directly without referencing the JSONB field:

```ruby
# user.rb
store_accessor :websites, :primary_website, :secondary_website, :optional_website
```

Which allows you to do this:

```ruby
user.primary_website
#=> 'http://wwww.example.com'
```
