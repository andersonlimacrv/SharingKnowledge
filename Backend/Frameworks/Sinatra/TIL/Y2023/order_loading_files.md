~~~html
- your_application
 + config/environment.rb
 + config.ru
~~~

1. `config.ru` is responsible for setting up the Rack middleware stack for your application
2. while `/config/environment.rb` is responsible for loading your application's environment and setting up global configuration

- `/config/environment.rb` is typically loaded before `config.ru` and is a higher priority file in the loading order.


### notes
- there are a few reasons why you might observe `config.ru` being loaded first in your particular case:
1. Configuration in config.ru can affect the loading of the environment in environment.rb. For example, if config.ru sets environment variables or requires additional libraries that are needed for the environment to load correctly, it may need to be loaded first.

2. The order in which files are loaded can depend on how your application is being started. For example, if you are using a web server like Passenger or Unicorn, these servers may have their own rules for loading files that differ from the default Rails behavior.

3. The order of file loading can also depend on the specific version of Rails you are using, as well as any custom configuration you have in your application.

In general, it's a good idea to follow the convention of loading /config/environment.rb before config.ru, as this is the default behavior in most Rails applications. However, if you're observing different behavior in your application, it may be due to specific factors in your application or environment.
