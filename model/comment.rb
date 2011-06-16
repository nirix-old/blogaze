#
# Blogaze
# Copyright (C) 2011 Jack Polgar
#
# Blogaze is released under the BSD 3-clause license.
#

class Comment < Sequel::Model
  plugin :validation_helpers
  
  many_to_one :post
  
  def validate
    validates_presence [:post_id, :body]
    validates_integer :post_id
  end
  
  def before_create
    super
    self.created_at = Time.now.to_i
    self.updated_at = 0
  end
end