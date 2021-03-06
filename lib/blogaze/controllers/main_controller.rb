#
# Blogaze
# Copyright (C) 2011-2013 Jack Polgar
#
# Blogaze is released under the BSD 3-clause license.
# http://opensource.org/licenses/BSD-3-Clause
#

module Blogaze
  module Controllers
    class MainController < Controller
      map '/'
      helper :paginate

      ##
      # Index page
      #
      def index(page = 1)
        # Check if we should change the title to include
        # what page we're on.
        if page.to_i > 1
          title "Page #{page}"
        end

        # Get the data and paginate it.
        data = ::Blogaze::Models::Post.order(:published_at.desc)
        @posts = paginate(data, :limit => @settings[:posts_per_page].to_i, :page => page.to_i)

        respond(view_file(:index))
      end
    end # MainController
  end # Controllers
end # Blogaze
