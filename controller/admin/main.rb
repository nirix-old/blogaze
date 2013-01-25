#
# Blogaze
# Copyright (C) 2011-2013 Jack Polgar
#
# Blogaze is released under the BSD 3-clause license.
# @license http://opensource.org/licenses/BSD-3-Clause
#

module Admin
  class Dashboard < Controller
    map '/admin'

    def index
      @title = "Admin - #{@settings[:title]}"
      respond(view_file('admin/index'))
    end
  end
end
