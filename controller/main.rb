# Default url mappings are:
#  a controller called Main is mapped on the root of the site: /
#  a controller called Something is mapped on: /something
# If you want to override this, add a line like this inside the class
#  map '/otherurl'
# this will force the controller to be mounted on: /otherurl

require __DIR__('../model/post')

class MainController < Controller
  # the index action is called automatically when no other action is specified
  def index
    @title = "Posts - #{@settings[:title]}"
    @posts = Post.order(:id.desc).limit 10
  end
end
