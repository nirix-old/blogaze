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