#
# Blogaze
# Copyright (C) 2011-2013 Jack Polgar
#
# Blogaze is released under the BSD 3-clause license.
# http://opensource.org/licenses/BSD-3-Clause
#

module Blogaze
  module Models
    ##
    # User group model
    #
    class Group < Sequel::Model
      one_to_many :user
    end # Group
  end # Models
end # Blogaze
