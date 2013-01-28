#
# Blogaze
# Copyright (C) 2011-2013 Jack Polgar
#
# Blogaze is released under the BSD 3-clause license.
# http://opensource.org/licenses/BSD-3-Clause
#

module Blogaze
  module Controllers
    class Pages < Controller
      map '/pages'

      ##
      # View page
      #
      # @param [String] slug Page slug
      #
      def view(slug = nil)
        slug = request.env["REQUEST_PATH"] if slug.nil?

        # Chomp chomp chomp, let's trim any unwanted
        # forward slashes from the begning and end of the url.
        slug = slug.chomp("/").reverse.chomp("/").reverse

        # Get page
        @page = ::Blogaze::Models::Page[:slug => slug]

        # Check if the page exists, if not render the
        # not found page.
        if @page.nil?
          title "Not Found"
          respond(view_file('pages/notfound'))
        else
          title @page.title
          respond(view_file('pages/page'))
        end
      end
    end # Pages
  end # Controllers
end # Blogaze
