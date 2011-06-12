# This file contains your application, it requires dependencies and necessary
# parts of the application.
#
# It will be required from either `config.ru` or `start.rb`

require 'rubygems'
require 'ramaze'
require 'time-lord'

# Get routes
require __DIR__('config/routes')

# Make sure that Ramaze knows where you are
Ramaze.options.roots = [__DIR__]

class Object
  def ago_in_words
    Time.at(self).ago_in_words.gsub(' ago', '')
  end
end

# Initialize controllers and models
require __DIR__('model/init')
require __DIR__('controller/init')
