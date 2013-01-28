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
    # Custom page model
    #
    class Page < Sequel::Model
      plugin :validation_helpers

      ##
      # Validations
      #
      def validate
        validates_presence [:title, :slug, :body]
      end

      def before_create
        super
        self.created_at = Time.now.to_i
        self.updated_at = 0
      end

      def before_save
        self.updated_at = Time.now.to_i
      end
    end # Page
  end # Models
end # Blogaze
