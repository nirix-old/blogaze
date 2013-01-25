#
# Blogaze
# Copyright (C) 2011-2013 Jack Polgar
#
# Blogaze is released under the BSD 3-clause license.
# @license http://opensource.org/licenses/BSD-3-Clause
#

module Blogaze
  class Post < Sequel::Model
    attr_accessor :post_tags
    plugin :validation_helpers

    many_to_one :user
    one_to_many :comment do |cmt|
      cmt.filter{in_moderation < 1}
    end

    def href
      return '/' + Time.at(self.published_at).year.to_s + '/' + Time.at(self.published_at).month.to_s + '/' + self.slug
    end

    def tags
      tags = []
      relationships = TagsRelationship.where(:object_id => self.id, :object_type => 'post')
      relationships.each do |rel|
        tags.push rel.tag
      end

      return tags
    end

    def body_partial
      body = self.body.split('<!-- MORE -->')
      return body[0]
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

    def after_save
      process_tags
    end

    private

    def process_tags
      tag_names = []
      post_tags.each do |tag|
        t = Tag.find_or_create(:name => tag.strip)
        tag_names.push t.name
        if t and !TagsRelationship.where(:object_id => id, :object_type => 'post', :tag_id => t.id).first
          TagsRelationship.new({ :object_id => id, :object_type => 'post', :tag_id => t.id }).save
        end
      end

      tags.each do |tag|
        if not tag_names.include?(tag.name)
          TagsRelationship.where({ :object_id => id, :object_type => 'post', :tag_id => tag.id }).delete
        end
      end
    end
  end
end
