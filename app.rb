#
# Blogaze
# Copyright (C) 2011-2013 Jack Polgar
#
# Blogaze is released under the BSD 3-clause license.
# @license http://opensource.org/licenses/BSD-3-Clause
#

require 'rubygems'
require 'ramaze'
require 'sequel'
require 'sequel/extensions/inflector'
require 'time-lord'
require './lib/theme'

# Config!
require __DIR__('config/config')

# Get routes
require __DIR__('config/routes')

# Make sure that Ramaze knows where we are
Ramaze.options.roots = [__DIR__]

# Get the database config
require __DIR__('config/database')

# Load default theme
require './themes/default'

# This is a total hack to get {blah].ago_in_words
# available on all numbers instead of having to add
# it to Bignum, Fixnum, and so on.
class Object
  def ago_in_words
    Time.at(self).ago_in_words
  end
end

# Helpers! not needed right now...
#require __DIR__('helper/init')

# Initialize controllers and models
require __DIR__('model/init')
require __DIR__('controller/init')
