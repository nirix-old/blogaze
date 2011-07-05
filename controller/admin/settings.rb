#
# Blogaze
# Copyright (C) 2011 Jack Polgar
#
# Blogaze is released under the BSD 3-clause license.
# @license http://opensource.org/licenses/BSD-3-Clause
#

module Admin
  class Settings < Controller
    map '/admin/settings'
    
    def index
      # Get themes
      @themes = []
      Dir.entries(File.expand_path(File.dirname('../')+'/themes')).each do |dir|
        @themes.push(dir) if dir != '.' and dir != '..'
      end
    end
    
    def save
      request[:settings].each do |setting, value|
        DB[:settings].where(:setting => setting).update(:value => value)
      end
      redirect Settings.r('/')
    end
  end
end