#
# Blogaze
# Copyright (C) 2011 Jack Polgar
#
# Blogaze is released under the BSD 3-clause license.
#

class Controller < Ramaze::Controller
  layout :default
  helper :xhtml, :maruku, :blue_form, :formatting
  engine :etanni
  
  def initialize
    super
    
    # Get user info
    if session[:logged_in]
      @userinfo = User[1]
    end
    
    # Get settings
    @settings = {}
    DB[:settings].all.each do |setting|
      @settings[setting[:setting].to_sym] = setting[:value]
    end
    
    # Set theme
    Ramaze.options.layouts = ["themes/#{@settings[:theme]}/layouts"]
    Ramaze.options.views = ["themes/#{@settings[:theme]}"]
  end
end

# Here go your requires for subclasses of Controller:
require __DIR__('main')
require __DIR__('posts')
require __DIR__('users')
require __DIR__('sessions')
require __DIR__('pages')

# Admin controllers
require __DIR__('admin/init')