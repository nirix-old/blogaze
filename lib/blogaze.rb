#
# Blogaze
# Copyright (C) 2011-2013 Jack Polgar
#
# Blogaze is released under the BSD 3-clause license.
# @license http://opensource.org/licenses/BSD-3-Clause
#

require 'ramaze'
require 'sequel'
require 'sequel/extensions/inflector'
require 'time-lord'
require "blogaze/version"
require "blogaze/theme"

module Blogaze
  class << self
    attr_accessor :root
    attr_accessor :database

    # Sets root and pushes it to Ramaze roots
    def root=(path)
      @root = path
      Ramaze.options.roots.push(path) if !Ramze.options.roots.include(path)
    end

    # Sets database and loads models
    def database=(database)
      @database = database
      require 'blogaze/models/init'
    end

    # Loads routes and controllers
    def start
      require 'blogaze/themes/default'
      require 'blogaze/routes'
      require 'blogaze/controllers/init'
    end
  end
end

# wat
class Fixnum
  def ago_in_words
    Time.at(self).ago_in_words
  end
end
