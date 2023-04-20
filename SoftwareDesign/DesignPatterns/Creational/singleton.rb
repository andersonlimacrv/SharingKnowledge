# frozen_string_literal: true

module SoftwareDesign
  module DesignPatterns
    module Creational
      class Singleton
        def definition
          RealWorldAnalogy.new(
            <<~DEFINE.strip
              a country can have only one officical goverment
            DEFINE
          )
        end

        RealWorldAnalogy = Struct.new(:context)

        # puts Singleton.new().definition
      end
    end
  end
end


### real world analogy
=begin
  The government is an excellent example of the Singleton pattern.
  A country can have only one official government.
  Regardless of the personal identities of the individuals who
  form governments, the title, “The Government of X”,
  is a global point of access that identifies the group of people in charge.
=end
# source: https://refactoring.guru/design-patterns/singleton

### problem solved
=begin
- This pattern is used to solve problems such as:
1. Resource Sharing: When multiple objects need to access a single resource,
such as a database connection or a file, the Singleton pattern ensures
that only one instance of the resource is created, thus preventing conflicts
that might arise from multiple instances trying to access the same resource.

2. Configuration Objects: In many applications, there are objects that are used
to store configuration data that is used throughout the application.
Using the Singleton pattern ensures that there is only one instance of
the configuration object, making it easy to access the configuration data
from anywhere in the application.

3. Logging Objects: In many applications, it is important to have a single
logging object that logs messages throughout the application. Using the
Singleton pattern ensures that there is only one instance of the logging object,
making it easy to manage the log messages.

4. Caching: In many applications, caching is used to store frequently accessed data,
such as database queries or API responses. Using the Singleton pattern ensures
that there is only one instance of the cache, making it easy to manage the
cached data and prevent conflicts that might arise from multiple instances of
the cache.
=end

### pros and cons
=begin
1. pros
- Provides a single point of access to an object, making it easy to control
and manage the object's behavior.
- Guarantees that only one instance of a class exists, preventing conflicts
that can arise from multiple instances.
- Improves performance by reducing the overhead of creating multiple instances
of the same object.
- Provides a global point of access, allowing objects to easily communicate
with each other.
2. cons
- Can make code more difficult to test, since it's difficult to replace
the Singleton with a test double.
- Can create tight coupling between objects, making it difficult to
change the behavior of the Singleton without affecting other parts of the code.
- Can create hidden dependencies in the code, since the Singleton can
be accessed from anywhere in the application.
- Can be misused, leading to bloated and complex code that is difficult to maintain.
=end
