#
# Blogaze
# Copyright (C) 2011-2013 Jack Polgar
#
# Blogaze is released under the BSD 3-clause license.
# http://opensource.org/licenses/BSD-3-Clause
#

module Blogaze
  module Controllers
    class Sessions < Controller
      map '/sessions'

      ##
      # Login page
      #
      def new
        @title = "Login - #{@settings[:title]}"
        respond(view_file('sessions/new'))
      end

      ##
      # Create session
      #
      def create
        @title = "Login - #{@settings[:title]}"
        @get_user = ::Blogaze::Models::User.where(:username => request[:username]).first

        if @get_user and @get_user.check_password(request[:password])
          session[:logged_in] = true
          session[:user_id] = @get_user.id
          redirect Ramaze.options.prefix
        else
          @login_error = true
        end

        respond(view_file('sessions/new'))
      end

      ##
      # Logout
      #
      def destroy
        session.delete(:logged_in)
        session.delete(:user_id)
        redirect Ramaze.options.prefix
      end
    end # Sessions
  end # Controllers
end # Blogaze
