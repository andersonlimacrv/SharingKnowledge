~~~html
- Session-based authentication is a way of authenticating a user on a website
or web application by creating a session for the user on the server.

- The session is typically stored in memory on the server, and a unique session identifier
is sent to the client as a cookie. The client then includes this session identifier with
each subsequent request to the server, allowing the server to identify the user and authenticate their requests.
~~~
- Here's an example of how session-based authentication could be implemented in a Ruby on Rails application:

~~~ruby
# In the controller handling the login request:
def create
  user = User.find_by(email: params[:email])
  if user&.authenticate(params[:password])
    session[:user_id] = user.id
    redirect_to root_path
  else
    flash[:danger] = "Invalid email or password"
    render :new
  end
end

# In a controller action requiring authentication:
before_action :require_login

def require_login
  unless logged_in?
    flash[:danger] = "You must be logged in to access this page"
    redirect_to login_path
  end
end

def logged_in?
  !!session[:user_id]
end
~~~

~~~html
This example uses the session hash provided by Rails to store the user's ID. The session hash is automatically encrypted and signed, so it's secure to use. The session hash is only accessible on the server-side, so it can only be accessed by code running on the server, which improves security by hiding the user's session ID from the client.

create method will look for user by email. If user and password match it will set the session[:user_id] equal to user.id and redirect to root_path.

require_login is a before_action which will check if user is logged in, if yes it will execute the action otherwise it will redirect to login page.

logged_in? is simple helper method which check if session[:user_id] is present or not, if present it will return true otherwise false
~~~


### Pros
~~~html
1. Faster subsequent logins, as the credentials are not required.
2. Improved user experience.
3. Fairly easy to implement. Many frameworks (like Django) provide this feature out-of-the-box.
~~~

### Cons
~~~html
1. It's stateful. The server keeps track of each session on the server-side. The session store, used for storing user session information, needs to be shared across multiple services to enable authentication. Because of this, it doesn't work well for RESTful services, since REST is a stateless protocol.
2. Cookies are sent with every request, even if it does not require authentication
3. Vulnerable to CSRF attacks
~~~
