#
# Blogaze
# Copyright (C) 2011 Jack Polgar
#
# Blogaze is released under the BSD 3-clause license.
#

require 'rubygems'
require 'ramaze'
require 'time-lord'

# Config!
require __DIR__('config/config')

# Get routes
require __DIR__('config/routes')

# Make sure that Ramaze knows where we are
Ramaze.options.roots = [__DIR__]

# This is a total hack to get {blah].ago_in_words
# available on all numbers instead of having to add
# it to Bignum, Fixnum, and so on.
class Object
  def ago_in_words
    Time.at(self).ago_in_words.gsub(' ago', '')
  end
end

# Helpers! not needed right now...
#require __DIR__('helper/init')

# Initialize controllers and models
require __DIR__('model/init')
require __DIR__('controller/init')
