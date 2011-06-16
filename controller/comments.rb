#
# Blogaze
# Copyright (C) 2011 Jack Polgar
#
# Blogaze is released under the BSD 3-clause license.
#

class Comments < Controller
  def create
    @post = Post[request[:post_id]]
    @comment = Comment.new(data)
    
    if @comment.valid?
      @comment.save
      redirect @post.href
    else
      flash[:comment_error] = "Please enter a comment"
      redirect @post.href
    end
  end
end