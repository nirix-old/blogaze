#
# Blogaze
# Copyright (C) 2011 Jack Polgar
#
# Blogaze is released under the BSD 3-clause license.
#

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
require __DIR__('users')

# Admin controllers
require __DIR__('admin/init')