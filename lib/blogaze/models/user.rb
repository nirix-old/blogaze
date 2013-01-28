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
    # User model
    #
    class User < Sequel::Model
      plugin :validation_helpers

      one_to_many :post
      many_to_one :group

      ##
      # Check if the users password matches
      # the supplied password.
      #
      # @param [String] password
      #
      def check_password(password)
        BCrypt::Password.new(self.password) == password
      end

      ##
      # Changes the users password.
      #
      # @param [String] new_password
      #
      def change_password(new_password)
        self.password = BCrypt::Password.create(new_password)
      end

      ##
      # Validations
      #
      def validate
        super

        # Username
        validates_unique :username
        validates_min_length 4, :username, :message => 'must be at least 4 characters' if new?
        validates_presence :username, :message => 'can\'t be empty'

        # Password
        validates_presence :password, :message => 'cant be blank'
        validates_min_length 6, :password, :message => 'must be at least 6 characters'

        # Email
        validates_unique :email
        validates_format /(.*)@(.*)\.(.*)/, :email, :message => 'is not a valid email'
      end

      def before_create
        self.password = BCrypt::Password.create(self.password)
        self.group_id = 3
      end
    end # User
  end # Models
end # Blogaze
