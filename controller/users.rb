#
# Blogaze
# Copyright (C) 2011 Jack Polgar
#
# Blogaze is released under the BSD 3-clause license.
#

class Users < Controller
  def new
    @title = "Register - #{@settings[:title]}"
    @user = User.new
  end
  
  def create
    @title = "Register - #{@settings[:title]}"
    data = {
      :username => request[:username],
      :password => request[:password],
      :email => request[:email],
      :group_id => 3
    }
    
    @user = User.new(data)
    
    if @user.valid?
      @user.save
      flash[:success] = "Account created, you may now login"
      redirect '/login'
    else
      render_view :new
    end
  end
end