#
# Blogaze
# Copyright (C) 2011-2013 Jack Polgar
#
# Blogaze is released under the BSD 3-clause license.
# @license http://opensource.org/licenses/BSD-3-Clause
#

module Blogaze
  module Controllers
    module Admin
      class Controller < ::Blogaze::Controllers::Controller
        layout 'admin'
        helper :blue_form

        def initialize
          super

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
