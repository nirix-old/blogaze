# Define a subclass of Ramaze::Controller holding your defaults for all
# controllers

class Controller < Ramaze::Controller
  layout :default
  helper :xhtml, :maruku
  engine :Nagoro
  
  def initialize
    super
    
    # Get settings
    #@settings = {:title => "Blogaze Dev"}
    
    @settings = {}
    DB[:settings].all.each do |setting|
      @settings[setting[:setting].to_sym] = setting[:value]
    end
  end
end

# Here go your requires for subclasses of Controller:
require __DIR__('main')
require __DIR__('posts')

# Admin controllers
require __DIR__('admin/init')