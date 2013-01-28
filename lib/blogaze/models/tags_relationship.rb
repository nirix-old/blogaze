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
    # Tag relationships model
    #
    class TagsRelationship < Sequel::Model
      many_to_one :tag
    end # TagsRelationship
  end # Models
end # Blogaze
