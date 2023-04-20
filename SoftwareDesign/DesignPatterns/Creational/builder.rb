# frozen_string_literal: true

module SoftwareDesign
  module DesignPatterns
    module Creational
      class Builder
        def definition; end
      end
    end
  end
end

# source: https://betterprogramming.pub/understanding-the-builder-design-pattern-f4f56fa18c9#:~:text=Builder%20Pattern%3A%20When%20to%20Use&text=This%20pattern%20should%20be%20used,representations%20of%20the%20same%20object.

### problem solved
=begin
1. The Builder pattern is a design pattern used to create complex objects by
separating the construction of the object from its representation.
The main problem solved by the Builder pattern is the creation of complex
objects that have multiple attributes, some of which may be optional or
have default values.

2. Without the Builder pattern, creating an object with many optional attributes
can be difficult and error-prone. For example, if an object has 10 attributes,
and only 2 of them are required, the constructor for that object would need
to have 10 parameters, most of which would be optional. This would make the
constructor difficult to use, and it would be easy to make mistakes when calling it.

3. With the Builder pattern, the construction of the object is separated from
its representation, making it easier to create complex objects. Instead of having
a single constructor with many parameters, the Builder pattern uses
a separate builder class that is responsible for creating the object.
The builder class has methods for setting each of the object's attributes,
allowing the user to set only the attributes they want to set, and leaving
the rest with their default values.

4. Using the Builder pattern not only makes it easier to create
complex objects, but it also makes the code more readable and maintainable,
as the construction logic is separated from the object's representation.
This allows for more flexibility in the creation of objects and makes it
easier to modify or extend the object's construction process in the future.
=end

### pros and cons
=begin
1. pros
- Flexibility: The Builder pattern provides a flexible way to create complex objects
with many optional attributes. It allows the user to set only the attributes
they need, and leaves the rest with their default values.

- Readability: The use of a builder class separates the object's construction
logic from its representation, making the code more readable and easier to maintain.

- Encapsulation: The builder class encapsulates the object's creation process,
hiding its complexity from the user. This improves the object's encapsulation
and reduces coupling between objects.

- Testability: The Builder pattern makes it easier to write test cases for
objects, as the construction process is separated from its representation.

2. cons
- Increased code complexity: The use of a builder class can increase code
complexity, as it adds an additional layer of abstraction to the code.

- Additional classes: The Builder pattern requires the creation of an
additional builder class, which can add to the code's size and complexity.

- Performance overhead: The use of the Builder pattern can result in a
performance overhead, as it involves additional object creation and method calls.

- Limited use: The Builder pattern is most useful for complex objects
with many optional attributes. For simpler objects, it may not be necessary
and can add unnecessary complexity to the code.
=end
