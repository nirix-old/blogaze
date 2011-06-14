#encoding: utf-8
#
# Blogaze
# Copyright (C) 2011 Jack Polgar
#
# Blogaze is released under the BSD 3-clause license.
#

class MainController < Controller
  def index
    @title = @settings[:title]
    @posts = Post.order(:id.desc).limit 10
  end
end
