~~~html
Token-based authentication is a way of authenticating a user on a website or web application by issuing a token to the client. The token is typically a signed and encrypted string that contains information about the user, such as their user ID or other identifying information. The client sends this token with each subsequent request to the server, allowing the server to identify the user and authenticate their requests.

Here's an example of how token-based authentication could be implemented in a Ruby on Rails application using the JWT(JSON Web Token) gem:
~~~

~~~ruby
# In the controller handling the login request:
def create
  user = User.find_by(email: params[:email])
  if user&.authenticate(params[:password])
    jwt = JWT.encode({ user_id: user.id }, Rails.application.secrets.secret_key_base, 'HS256')
    render json: { token: jwt }
  else
    head :unauthorized
  end
end

# In a controller action requiring authentication:
before_action :authenticate

def authenticate
  begin
    jwt = request.headers['Authorization'].split(' ').last
    decoded = JWT.decode(jwt, Rails.application.secrets.secret_key_base, true, { algorithm: 'HS256' })
    @current_user = User.find(decoded[0]["user_id"])
  rescue JWT::DecodeError
    head :unauthorized
  end
end
~~~

~~~html
In this example, after successful login, the server creates a JWT token that contains the user_id and sign it with a secret key using HS256 algorithm. This token is sent to the client.

The authenticate is a before_action which will decode the token from the request headers and look for user_id in it. If the token is invalid it will return unauthorized(401) response.

You can also set expiration time in the token, you have to encode the JWT with exp claim, after that you can check if the token is expired or not by checking the exp claim of the decoded token.

It's also possible to use a different library or gem for token-based authentication, but the general idea is the same: the client sends a token with each request, and the server uses that token to authenticate the user.
~~~


### Pros
~~~html
1. It's stateless. The server doesn't need to store the token as it can be validated using the signature. This makes the request faster as a database lookup is not required.
2. Suited for a microservices architecture, where multiple services require authentication. All we need to configure at each end is how to handle the token and the token secret.
~~~

### Cons
~~~html
1. Depending on how the token is saved on the client, it can lead to XSS (via localStorage) or CSRF (via cookies) attacks.
2. Tokens cannot be deleted. They can only expire. This means that if the token gets leaked, an attacker can misuse it until expiry. Thus, it's important to set token expiry to something very small, like 15 minutes.
3. Refresh tokens need to be set up to automatically issue tokens at expiry.
4. One way to delete tokens is to create a database for blacklisting tokens. This adds extra overhead to the microservice architecture and introduces state.
~~~
