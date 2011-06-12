require 'bcrypt'

class User < Sequel::Model
  plugin :validation_helpers
  
  one_to_many :post
  
  def validate
    super
    
    # Username
    validates_unique :username
    validates_min_length 6, :username, :message => 'must be at least 6 characters'
    validates_presence :username, :message => 'can\'t be empty'
    
    # Password
    validates_presence :password, :message => 'cant be blank'
    validates_min_length 6, :password, :message => 'must be at least 6 characters'
    
    # Email
    validates_unique :email
    validates_format /(.*)@(.*)\.(.*)/, :email, :message => 'is not a valid email'
  end
  
  def before_create
    self.password = BCrypt::Password.create(self.password, :cost => 10)
  end
  
  def before_save
    self.password = BCrypt::Password.create(self.password, :cost => 10)
  end
end