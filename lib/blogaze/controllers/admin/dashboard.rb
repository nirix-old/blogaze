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
      class Dashboard < Controller
        map '/admin'

        ##
        # Admin index
        #
        def index
          @title = "Admin - #{@settings[:title]}"
          respond(view_file('admin/index'))
        end
      end # Dashboard
    end # Admin
  end # Controllers
end # Blogaze
