#
# Blogaze
# Copyright (C) 2013 Jack Polgar
#
# Blogaze is released under the BSD 3-clause license.
#

class TagsRelationship < Sequel::Model
  many_to_one :tag
end
