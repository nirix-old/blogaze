#
# Blogaze
# Copyright (C) 2011-2013 Jack Polgar
#
# Blogaze is released under the BSD 3-clause license.
# http://opensource.org/licenses/BSD-3-Clause
#

module Blogaze
  module Controllers
    module Admin
      class Posts < Controller
        map '/admin/posts'

        def initialize
          super

          # Set title
          title "Posts"
        end

        # Make sure the user has permission to create posts
        before :new, :create do
          title "New Post"
          if !@userinfo.group.create_posts
            flash[:error] = "You don't have permission to do that."
            redirect '/login'
          end
        end

        # Make sure the user has permission to edit posts
        before :edit, :save do
          title "Edit Page"
          if !@userinfo.group.edit_posts
            flash[:error] = "You don't have permission to do that."
            redirect '/login'
          end
        end

        # Make sure the user has permission to delete posts
        before :delete do
          if !@userinfo.group.delete_posts
            flash[:error] = "You don't have permission to do that."
            redirect '/login'
          end
        end

        ##
        # Post listing
        #
        def index
          @posts = ::Blogaze::Models::Post.order(:id.desc).all
          respond(view_file('admin/posts/index'))
        end

        ##
        # New post form
        #
        def new
          @post = ::Blogaze::Models::Post.new
          respond(view_file('admin/posts/new'))
        end

        ##
        # Create post
        #
        def create
          data = {
            :title => request[:title],
            :body => request[:body],
            :user_id => @userinfo.id,
            :post_tags => request[:post_tags].is_a?(String) ? request[:post_tags].gsub(', ', ',').split(',') : []
          }
          @post = ::Blogaze::Models::Post.new(data)

          if @post.valid?
            @post.save
            flash[:success] = "Post created successfully"
            redirect Posts.r('/')
          else
            @post.post_tags = @post.post_tags.join(', ')
            respond(view_file('admin/posts/new'))
          end
        end

        ##
        # Edit post
        #
        # @param [Integer] post_id
        #
        def edit(post_id)
          @post = ::Blogaze::Models::Post[post_id]

          post_tags = []
          @post.tags.each do |tag|
            post_tags.push tag.name
          end
          @post.post_tags = post_tags.join(', ')

          respond(view_file('admin/posts/edit'))
        end

        ##
        # Save post
        #
        # @param [Integer] post_id
        #
        def save(post_id)
          @post = ::Blogaze::Models::Post[post_id]
          @post.title = request[:title]
          @post.body = request[:body]
          @post.post_tags = request[:post_tags].is_a?(String) ? request[:post_tags].gsub(', ', ',').split(',') : []

          if @post.valid?
            @post.save
            flash[:success] = "Post saved successfully"
            redirect Posts.r('/')
          else
            respond(view_file('admin/posts/edit'))
          end
        end

        ##
        # Delete post
        #
        # @param [Integer] post_id
        #
        def delete(post_id)
          post = ::Blogaze::Models::Post[post_id]
          post.delete
          ::Blogaze::Models::TagsRelationship.where(:object_type => 'post', :object_id => post.id).delete
          flash[:success] = "Post deleted successfully"
          redirect Posts.r('/')
        end
      end # Posts
    end # Admin
  end # Controllers
end # Blogaze
