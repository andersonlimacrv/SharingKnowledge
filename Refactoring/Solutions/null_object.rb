# frozen_string_literal: true

module Solutions
  class NullObject
    def usage
      <<~USAGE.strip
        Instead of null, return a null object that exhibits the default behavior.
      USAGE
    end

    def apply_for(*code_smells); end
  end
end

=begin
1. before using the Null Object
# Order.rb
class Order < ApplicationRecord
  belongs_to :customer, optional: true
end

# OrderController.rb
class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    if @order.customer.nil?
      @customer_name = "Guest"
    else
      @customer_name = @order.customer.name
    end
  end
end

2. after using the Null Object
# NullCustomer.rb
class NullCustomer
  def name
    "Guest"
  end
end

# Order.rb
class Order < ApplicationRecord
  belongs_to :customer, optional: true

  def customer
    super || NullCustomer.new
  end
end

# OrdersController.rb
class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @customer_name = @order.customer.name
  end
end
=end

=begin
```html
In fact, the Null Object pattern is a general design pattern that can be applied
in any object-oriented language or framework, including Ruby on Rails.
The idea behind the Null Object pattern is to provide a default implementation
for an object that is missing or null, so that the code that uses the object
doesn't have to handle null values explicitly.
```

```ruby
class User
  attr_reader :profile_picture

  def initialize(profile_picture)
    @profile_picture = profile_picture
  end

  def profile_picture_url
    profile_picture.url
  end
end
```

```html
In this example, the User class has a profile_picture_url method that
returns the URL of the user's profile picture. However,
if the user doesn't have a profile picture, the profile_picture attribute
will be nil, and calling profile_picture.url will result in a NoMethodError.
To avoid this, we can apply the Null Object pattern by creating a
NullProfilePicture class that provides a default implementation of the url method:
```

```ruby
class NullProfilePicture
  def url
    "https://example.com/default_profile_picture.png"
  end
end

class User
  attr_reader :profile_picture

  def initialize(profile_picture)
    @profile_picture = profile_picture
  end

  def profile_picture_url
    profile_picture&.url || NullProfilePicture.new.url
  end
end
```

### another version using Struct

```ruby
NullProfilePicture = Struct.new(:url) do
  def url
    "https://example.com/default_profile_picture.png"
  end
end

class User
  attr_reader :profile_picture

  def initialize(profile_picture)
    @profile_picture = profile_picture
  end

  def profile_picture_url
    profile_picture&.url || NullProfilePicture.new.url
  end
end
```
=end
