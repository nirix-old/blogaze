#
# Blogaze
# Copyright (C) 2011 Jack Polgar
#
# Blogaze is released under the BSD 3-clause license.
#

class Group < Sequel::Model
  one_to_many :user
end