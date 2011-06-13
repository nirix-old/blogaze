#
# Blogaze
# Copyright (C) 2011 Jack Polgar
#
# Blogaze is released under the BSD 3-clause license.
#

class Posts < Controller
  def view(slug)
    @post = Post.filter(:slug => slug).first
    @title = @post.title + ' - ' + @settings[:title]
  end
end