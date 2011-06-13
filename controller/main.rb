#
# Blogaze
# Copyright (C) 2011 Jack Polgar
#
# Blogaze is released under the BSD 3-clause license.
#

require __DIR__('../model/post')

class MainController < Controller
  # the index action is called automatically when no other action is specified
  def index
    @title = "Posts - #{@settings[:title]}"
    @posts = Post.order(:id.desc).limit 10
  end
end
