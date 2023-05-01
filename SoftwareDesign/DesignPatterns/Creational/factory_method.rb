# frozen_string_literal: true

module SoftwareDesign
  module DesignPatterns
    module Creational
      class FactoryMethod
        def definition; end
      end
    end
  end
end


# source: https://medium.com/nerd-for-tech/understanding-factory-method-design-pattern-4d7ba8f0dfc4
# source: https://betterprogramming.pub/understanding-the-factory-method-design-pattern-f5ec631c99d8

### problem solved
=begin
1. The Factory Method pattern solves the problem of creating objects
without specifying the exact class of object that will be created.
It provides an interface for creating objects, but allows subclasses
to decide which class to instantiate.

2. This pattern is particularly useful in situations where there are multiple
classes that implement a common interface, and the choice of which class
to use may depend on runtime conditions or configuration settings.

3. Using the Factory Method pattern, you can encapsulate the object
creation process and provide a single point of control for creating objects
of a specific type. This makes your code more modular and easier to maintain,
since changes to the object creation process can be made in a single
location without affecting the rest of the code.

4. In addition, the Factory Method pattern promotes loose coupling between
classes, since the client code that uses the Factory Method
does not need to know about the concrete classes that
are being instantiated. Instead, it can work with the abstract interface
provided by the Factory Method. This makes your code more flexible
and easier to extend in the future.
=end

### pros and cons
=begin
I. pros
1. Encapsulation: The Factory Method pattern encapsulates the object
creation process in a separate class, which makes it easier to maintain
and modify your code. It also helps to reduce code duplication.

2. Flexibility: The Factory Method pattern provides a flexible way
to create objects, since it allows subclasses to determine
which class to instantiate based on runtime conditions or configuration settings.

3. Loose coupling: The Factory Method pattern promotes loose
coupling between classes, since client code does not need
to know about the concrete classes that are being instantiated.
This makes it easier to change the behavior of your code without
affecting the rest of the system.

4. Testability: The Factory Method pattern makes it easier to
write testable code, since you can create mock objects to
simulate the behavior of the concrete classes.

II. cons
1. Complexity: The Factory Method pattern can add
complexity to your code, since you need to create
a separate Factory class for each class hierarchy.

2. Overhead: The Factory Method pattern can add overhead
to your code, since you need to create a separate Factory
class for each class hierarchy.

3. Abstraction: The Factory Method pattern requires the use of
an abstract interface, which can be difficult to understand
and use for less experienced developers.

4. Single Responsibility Principle (SRP): The Factory Method
pattern can sometimes violate the SRP principle,
since the Factory class is responsible for both object
creation and object initialization.
=end
