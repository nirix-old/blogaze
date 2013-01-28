#
# Blogaze
# Copyright (C) 2011-2013 Jack Polgar
#
# Blogaze is released under the BSD 3-clause license.
# http://opensource.org/licenses/BSD-3-Clause
#

module Blogaze
  module Controllers
    module Admin
      class Controller < ::Blogaze::Controllers::Controller
        layout 'admin'
        helper :blue_form

        def initialize
          super

          # Set AdminCP title
          title "Admin"

          # Make sure the user is logged in and has permission
          if !@userinfo.respond_to?('group') or @userinfo.group.is_admin != 1
            redirect '/login'
          end
        end
      end # Controller
    end # Admin
  end # Controllers
end # Blogaze

Dir.glob(File.dirname(__FILE__) + '/*.rb').each do |controller|
  require(controller)
end
