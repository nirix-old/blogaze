#
# Blogaze
# Copyright (C) 2011 Jack Polgar
#
# Blogaze is released under the BSD 3-clause license.
#

class Sessions < Controller
  def new
    @title = "Login - #{@settings[:title]}"
  end
  
  def create
    @title = "Login - #{@settings[:title]}"
    @get_user = User[:username => request[:username]]
    
    if @get_user.respond_to?('password') and @get_user.password == Digest::SHA1.hexdigest(request[:password])
      session[:logged_in] = true
      session[:user_id] = @get_user.id
      redirect Ramaze.options.prefix
    else
      @login_error = true
      render_view :new
    end
  end
  
  def destroy
    session.delete(:logged_in)
    session.delete(:user_id)
    redirect Ramaze.options.prefix
  end
end