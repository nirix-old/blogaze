#
# Blogaze
# Copyright (C) 2011-2013 Jack Polgar
#
# Blogaze is released under the BSD 3-clause license.
# @license http://opensource.org/licenses/BSD-3-Clause
#

module Blogaze
  class Sessions < Controller
    map '/sessions'

    def new
      @title = "Login - #{@settings[:title]}"
      respond(view_file('sessions/new'))
    end

    def create
      @title = "Login - #{@settings[:title]}"
      @get_user = User[:username => request[:username]]

      if @get_user.respond_to?('password') and @get_user.password == Digest::SHA1.hexdigest(request[:password])
        session[:logged_in] = true
        session[:user_id] = @get_user.id
        redirect Ramaze.options.prefix
      else
        @login_error = true
      end

      respond(view_file('sessions/new'))
    end

    def destroy
      session.delete(:logged_in)
      session.delete(:user_id)
      redirect Ramaze.options.prefix
    end
  end
end
