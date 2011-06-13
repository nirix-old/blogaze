#
# Blogaze
# Copyright (C) 2011 Jack Polgar
#
# Blogaze is released under the BSD 3-clause license.
#

class Post < Sequel::Model
  plugin :validation_helpers
  
  many_to_one :user
  
  def validate
    validates_presence [:title, :body, :user_id]
    validates_integer :user_id
  end
  
  def before_create
    super
    self.created_at = Time.now.to_i
    self.published_at = Time.now.to_i
  end
  
  def before_save
    self.updated_at = Time.now.to_i
  end
end