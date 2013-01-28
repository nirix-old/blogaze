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
    # Tags model
    #
    class Tag < Sequel::Model
      ##
      # Returns the URI to the page
      # listing posts belonging to the tag.
      #
      # @return [String]
      #
      def href
        "/tags/#{slug}"
      end

      def before_save
        self.slug = Innate::Helper::CGI.u(self.name.scan(/\w+/).join('-')).downcase
      end
    end # Tag
  end # Models
end # Blogaze
