#
# Blogaze
# Copyright (C) 2011 Jack Polgar
#
# Blogaze is released under the BSD 3-clause license.
#

class Page < Sequel::Model
  plugin :validation_helpers
  
  def validate
    validates_presence [:title, :slug, :body]
  end
  
  def before_create
    super
    self.created_at = Time.now.to_i
    self.updated_at = 0
  end
  
  def before_save
    self.updated_at = Time.now.to_i
  end
end