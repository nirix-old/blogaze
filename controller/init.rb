# Define a subclass of Ramaze::Controller holding your defaults for all
# controllers

#Ramaze::Route[/\/[0-9]+\/[0-9]+\/([\w\.\-]+)/] = '/posts/view/%s' #GOOD
#Ramaze::Route[/([0-9]+)/([0-9]+)/([\w]+)/] = '/posts/view/%s' #BAD

Ramaze::Route['view post'] = lambda do |path, request|
  if path =~ /\/[0-9]+\/[0-9]+\/([\w\.\-]+)/
    return "/posts/view/#{$1}"
  end
end

class Controller < Ramaze::Controller
  layout :default
  helper :xhtml, :maruku
  engine :Nagoro
  
  def initialize
    super
    
    # Get settings
    @settings = {:title => "Blogaze Dev"}
  end
end

# Here go your requires for subclasses of Controller:
require __DIR__('main')
require __DIR__('posts')