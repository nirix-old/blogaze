#
# Blogaze
# Copyright (C) 2011 Jack Polgar
#
# Blogaze is released under the BSD 3-clause license.
#

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
    
    def index
      @posts = Post.order(:id.desc).all
    end
    
    def new
      @post = Post.new
    end
    
    def create
      data = {
        :title => request[:title],
        :body => request[:body],
        :user_id => @userinfo.id,
      }
      @post = Post.new(data)
      
      if @post.valid?
        @post.save
        redirect '/admin/posts'
      else
        render_file 'view/admin/posts/new.nag'
      end
    end
    
    def edit(post_id)
      @post = Post[post_id]
    end
    
    def save(post_id)
      @post = Post[post_id]
      @post.title = request[:title]
      @post.body = request[:body]
      
      if @post.valid?
        @post.save
        redirect Posts.r('/')
      else
        render_file 'view/admin/posts/edit.nag'
      end
    end
    
    def delete(post_id)
      Post[post_id].delete
      redirect Posts.r('/')
    end
  end
end