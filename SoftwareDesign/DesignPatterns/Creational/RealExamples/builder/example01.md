### example

```html
Suppose we have a class called User that represents a user of our system. The User class has several attributes, including a first name, last name, email address, and password. We want to create users with different combinations of these attributes. To accomplish this, we can use the Builder pattern.

First, we create a builder class called UserBuilder that is responsible for building users:
```

```ruby
class UserBuilder
  def initialize
    @user = User.new
  end

  def with_first_name(first_name)
    @user.first_name = first_name
    self
  end

  def with_last_name(last_name)
    @user.last_name = last_name
    self
  end

  def with_email(email)
    @user.email = email
    self
  end

  def with_password(password)
    @user.password = password
    self
  end

  def build
    @user
  end
end
```

```html
The UserBuilder class has an initializer method that creates a new, empty User object. It also has several methods that allow us to set the attributes of the user, including with_first_name, with_last_name, with_email, and with_password. Finally, it has a build method that returns the completed User object.

Next, we define the User class itself:
```

```ruby
class User
  attr_accessor :first_name, :last_name, :email, :password

  def initialize
    @first_name = nil
    @last_name = nil
    @email = nil
    @password = nil
  end
end
```

```html
The User class has an initializer method that creates a new, empty User object with default attribute values of nil. It also has attributes for the user's first name, last name, email, and password.

Now, let's say we want to create a new user with the first name "John", last name "Doe", email "johndoe@example.com", and password "secret123". We can use the UserBuilder class as follows:
```

```ruby
user = UserBuilder.new
                .with_first_name("John")
                .with_last_name("Doe")
                .with_email("johndoe@example.com")
                .with_password("secret123")
                .build
```

```html
This creates a new UserBuilder object, sets the desired attribute values, and builds a new User object with the specified attributes.

Using the Builder pattern in this way allows us to create users with different combinations of attributes without having to create separate constructors or initializer methods for each combination. It also allows us to add or remove attributes as desired, making the creation process more flexible.
```
