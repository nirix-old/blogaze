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
    
    realpath = File.realpath('./')
    if File.exists?(action.layout.to_a[1].to_s.gsub(realpath + '/themes/default/layouts/', ''))
      layout_file = action.layout.to_a[1].to_s.gsub(realpath + '/themes/default/layouts/', '')
    end
    if File.exists?(realpath + "/themes/#{@settings[:theme]}/" + action.view.gsub(realpath + '/themes/default/', ''))
      action.view = realpath + "/themes/#{@settings[:theme]}/" + action.view.gsub(realpath + '/themes/default/', '')
    end
  end
end

# Here go your requires for subclasses of Controller:
Dir.glob(File.dirname(__FILE__) + '/*.rb').each do |controller|
  require(controller)
end

# Admin controllers
require __DIR__('admin/init')