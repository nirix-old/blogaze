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
    
    # Update the theme directory
    #Ramaze.options.layouts = ["themes/#{@settings[:theme]}/layouts"]
    #Ramaze.options.views = ["themes/#{@settings[:theme]}"]
		#action.view = "themes/#{@settings[:theme]}" + action.view ? action.view : '/index.xhtml'
		#@lolwut = # + ".xhtml"
		#@lolwutt = __DIR__#action.path
		#@lolwut = action.layout
		#realpath = File.realpath('./')
		
		#@lolwutt = layout_file
		
		
		
		realpath = File.realpath('./')
		layout_file = action.layout.to_a[1].to_s.gsub(realpath + '/themes/default/layouts/', '')
		action.view = realpath + "/themes/#{@settings[:theme]}/" + action.view.gsub(realpath + '/themes/default/', '')
  end
	
	def get_view(view, args = {})
		if args[:layout]
			#action.view = 'test'
		end
		#ext = args[:ext] ? args[:ext] : 'xhtml'
		#"themes/#{@settings[:theme]}/#{view}.#{ext}"
	end
end

# Here go your requires for subclasses of Controller:
Dir.glob(File.dirname(__FILE__) + '/*.rb').each do |controller|
  require(controller)
end

# Admin controllers
require __DIR__('admin/init')