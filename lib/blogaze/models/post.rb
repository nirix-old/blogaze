#
# Blogaze
# Copyright (C) 2011-2013 Jack Polgar
#
# Blogaze is released under the BSD 3-clause license.
# @license http://opensource.org/licenses/BSD-3-Clause
#

module Blogaze
  module Models
    class Post < Sequel::Model
      attr_accessor :post_tags
      plugin :validation_helpers

      many_to_one :user
      one_to_many :comments do |cmt|
        cmt.filter{in_moderation < 1}
      end

      ##
      # Returns the URI to the post.
      #
      def href
        return '/' + Time.at(self.published_at).year.to_s + '/' + Time.at(self.published_at).month.to_s + '/' + self.slug
      end

      ##
      # Returns an array of the posts tags.
      #
      def tags
        tags = []
        relationships = ::Blogaze::Models::TagsRelationship.where(:object_id => self.id, :object_type => 'post')
        relationships.each do |rel|
          tags.push rel.tag
        end

        return tags
      end

      ##
      # Returns the partial body of the post.
      #
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
        # Names of tags, obviously
        tag_names = []

        # Loop over new tags and create them and the relationships, if needed
        post_tags.each do |tag|
          t = Tag.find_or_create(:name => tag.strip)
          tag_names.push t.name
          if t and !::Blogaze::Models::TagsRelationship.where(:object_id => id, :object_type => 'post', :tag_id => t.id).first
            ::Blogaze::Models::TagsRelationship.new({ :object_id => id, :object_type => 'post', :tag_id => t.id }).save
          end
        end

        # Loop over all tags and delete relationships
        # for removed tags.
        tags.each do |tag|
          if not tag_names.include?(tag.name)
            ::Blogaze::Models::TagsRelationship.where({ :object_id => id, :object_type => 'post', :tag_id => tag.id }).delete
          end
        end
      end
    end # Post
  end # Models
end # Blogaze
