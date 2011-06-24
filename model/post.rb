#
# Blogaze
# Copyright (C) 2011 Jack Polgar
#
# Blogaze is released under the BSD 3-clause license.
#

class Post < Sequel::Model
  plugin :validation_helpers
  
  many_to_one :user
  one_to_many :comment do |cmt|
    cmt.filter{in_moderation < 1}
  end
  
  def href
    return '/' + Time.at(self.published_at).year.to_s + '/' + Time.at(self.published_at).month.to_s + '/' + self.slug
  end
  
  def validate
    validates_presence [:title, :body, :user_id]
    validates_integer :user_id
  end
  
  def before_create
    super
    self.slug = Innate::Helper::CGI.u(self.title.scan(/\w+/).join('-')).downcase
    self.created_at = Time.now.to_i
    self.published_at = Time.now.to_i
    self.updated_at = 0
  end
  
  def before_save
    self.slug = Innate::Helper::CGI.u(self.title.scan(/\w+/).join('-')).downcase
    self.updated_at = Time.now.to_i
  end
end