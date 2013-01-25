#
# Blogaze
# Copyright (C) 2011-2013 Jack Polgar
#
# Blogaze is released under the BSD 3-clause license.
# @license http://opensource.org/licenses/BSD-3-Clause
#

class Posts < Controller
  def view(slug)
    @post = Post.filter(:slug => slug).first
    return respond(view_file('pages/notfound')) if @post.nil?

    # Set title
    @title = @post.title + ' - ' + @settings[:title]

    # Instead of a controller just for comment creation
    # let's just put it here, that way we can display
    # errors with the new comment form.
    if request[:new_comment].to_i == 1
      data = {
        :post_id => @post.id,
        :author => request[:author],
        :body => request[:body],
        :in_moderation => @settings[:moderate_comments]
      }
      @comment = Comment.new(data)
      if @comment.valid?
        @comment.save
        flash[:success] = "Your comment has been posted"
        redirect @post.href
      end
    else
      @comment = Comment.new
    end

    respond(view_file('posts/view'))
  end
end
