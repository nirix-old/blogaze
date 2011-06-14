#
# Blogaze
# Copyright (C) 2011 Jack Polgar
#
# Blogaze is released under the BSD 3-clause license.
#

module Admin
  class Controller < ::Controller
    helper :blue_form
    
    def initialize
      super
      
      if !@userinfo.respond_to?('group') or !@userinfo.group.is_admin
        redirect '/login'
      end
    end
  end
end

require __DIR__('main')
require __DIR__('posts')