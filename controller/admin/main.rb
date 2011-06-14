#
# Blogaze
# Copyright (C) 2011 Jack Polgar
#
# Blogaze is released under the BSD 3-clause license.
#

module Admin
  class Dashboard < Controller
    map '/admin'
    
    def index
      "Admin Dashboard"
    end
  end
end