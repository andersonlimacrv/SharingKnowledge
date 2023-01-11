~~~html
OAuth and OpenID are both open standard protocols for authorization.

OAuth is a protocol that allows a user to grant a third-party application access to their resources (such as data stored on a service like Google or Twitter) without sharing their credentials (typically a username and password). For example, a user might grant a third-party application access to their Google calendar data without sharing their Google account password. OAuth can be used to grant access to resources in a variety of ways, such as granting an application "read" access to a user's data or "write" access to a user's data.

OpenID, on the other hand, is a protocol for authentication (i.e., logging in to a service). It allows a user to authenticate to an application using an external service (such as Google or Yahoo!) without the application having to ask the user for their password. In other words, a user can log in to an application using their Google account instead of creating a new account just for that application.
~~~

- Here's an example of how you might use the omniauth gem in Ruby to implement OAuth authentication with a service like Google:

~~~ruby
require 'omniauth-google-oauth2'

use OmniAuth::Builder do
  provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET']
end
~~~

- Here is an example of OpenID authentication in ruby,using devise and openid_connect gem

~~~ruby
#Gemfile
gem 'openid_connect'
gem 'devise'

#config/routes.rb
devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

#config/initializers/devise.rb
config.omniauth :openid_connect,
              name: :my_openid_provider,
              scope: [:openid, :email, :profile],
              response_type: :code,
              issuer: 'https://my_openid_provider',
              client_options: {
                identifier: 'client_id',
                secret: 'client_secret',
                redirect_uri: 'http://localhost:3000/users/auth/my_openid_provider/callback',
                host: 'https://my_openid_provider'
              }
~~~

### Pros
~~~html
1. Improved security.
2. Easier and faster log in flows since there's no need to create and remember a username or password.
3. In case of a security breach, no third-party damage will occur, as the authentication is passwordless.
~~~

### Cons
~~~html
1. Your application now depends on another app, outside of your control. If the OpenID system is down, users won't be able to log in.
2. People often tend to ignore the permissions requested by OAuth applications.
3. Users that don't have accounts on the OpenID providers that you have configured won't be able to access your application. The best approach is to implement both -- e.g., username and password and OpenID -- and let the user choose.
~~~
