#
# Blogaze
# Copyright (C) 2011 Jack Polgar
#
# Blogaze is released under the BSD 3-clause license.
#

class AdminPostsController < AdminController
  map '/admin/posts'
  
  def initialize
    super
  end
  
  def index
    "Hello admin/posts"
  end
  
  def new
    "New Post"
  end
end