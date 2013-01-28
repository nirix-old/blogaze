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

      ##
      # Register form
      #
      def new
        @title = "Register - #{@settings[:title]}"
        @user = ::Blogaze::Models::User.new
        respond(view_file('users/new'))
      end

      ##
      # Create user
      #
      def create
        return redirect('/') unless request.post?

        @title = "Register - #{@settings[:title]}"
        data = {
          :username => request[:username],
          :password => request[:password],
          :email => request[:email],
          :group_id => 3
        }

        @user = ::Blogaze::Models::User.new(data)

        # Check for errors
        if @user.valid?
          @user.save
          flash[:success] = "Account created, you may now login"
          redirect '/login'
        else
          respond(view_file('users/new'))
        end
      end

      def profile
        return respond(view_file('sessions/new')) unless session[:logged_in]
        respond(view_file('users/profile'))
      end
    end # Users
  end # Controllers
end # Blogaze
