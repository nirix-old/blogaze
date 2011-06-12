class UsersController < Controller
  helper :blue_form, :formatting
  
  def new
    @user = User.new
  end
  
  def create
    data = {
      :username => request[:username],
      :password => request[:password],
      :email => request[:email]
    }
    
    @user = User.new(data)
    
    if @user.valid?
      @user.save
      redirect Ramaze.options.prefix
    else
      render_file 'view/users/new.nag'
    end
  end
end