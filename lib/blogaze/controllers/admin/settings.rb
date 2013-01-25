#
# Blogaze
# Copyright (C) 2011-2013 Jack Polgar
#
# Blogaze is released under the BSD 3-clause license.
# @license http://opensource.org/licenses/BSD-3-Clause
#

module Blogaze
  module Controllers
    module Admin
      class Settings < Controller
        map '/admin/settings'

        ##
        # Settings form
        #
        def index
          # Get themes
          @themes = []

          ::Blogaze::Theme.registered.each do |theme|
            @themes.push theme[0].to_s
          end

          respond(view_file('admin/settings/index'))
        end

        ##
        # Save settings
        #
        def save
          request[:settings].each do |setting, value|
            ::Blogaze.database[:settings].where(:setting => setting).update(:value => value)
          end
          redirect Settings.r('/')
        end
      end # Settings
    end # Admin
  end # Controllers
end # Blogaze
