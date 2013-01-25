#
# Blogaze
# Copyright (C) 2011-2013 Jack Polgar
#
# Blogaze is released under the BSD 3-clause license.
# @license http://opensource.org/licenses/BSD-3-Clause
#

module Blogaze
  module Controllers
    class Users < Controller
      map '/users'

      def new
        @title = "Register - #{@settings[:title]}"
        @user = User.new
        respond(view_file('users/new'))
      end

      def create
        @title = "Register - #{@settings[:title]}"
        data = {
          :username => request[:username],
          :password => request[:password],
          :email => request[:email],
          :group_id => 3
        }

        @user = User.new(data)

        if @user.valid?
          @user.save
          flash[:success] = "Account created, you may now login"
          redirect '/login'
        else
          respond(view_file('users/new'))
        end
      end
    end # Users
  end # Controllers
end # Blogaze
