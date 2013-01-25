#
# Blogaze
# Copyright (C) 2011-2013 Jack Polgar
#
# Blogaze is released under the BSD 3-clause license.
# @license http://opensource.org/licenses/BSD-3-Clause
#

module Blogaze
  module Controllers
    module Admin
      class Posts < Controller
        map '/admin/posts'

        before :new, :create do
          if !@userinfo.group.create_posts
            flash[:error] = "You don't have permission to do that."
            redirect '/login'
          end
        end

        before :edit, :save do
          if !@userinfo.group.edit_posts
            flash[:error] = "You don't have permission to do that."
            redirect '/login'
          end
        end

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
          @title = "Posts - Admin - #{@settings[:title]}"
          @posts = ::Blogaze::Models::Post.order(:id.desc).all
          respond(view_file('admin/posts/index'))
        end

        ##
        # New post form
        #
        def new
          @title = "New Post - Posts - Admin - #{@settings[:title]}"
          @post = ::Blogaze::Models::Post.new
          respond(view_file('admin/posts/new'))
        end

        ##
        # Create post
        #
        def create
          @title = "New Post - Posts - Admin - #{@settings[:title]}"
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
        def edit(post_id)
          @title = "Edit Post - Posts - Admin - #{@settings[:title]}"
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
        def save(post_id)
          @title = "Edit Post - Posts - Admin - #{@settings[:title]}"
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
