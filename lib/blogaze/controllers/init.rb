#
# Blogaze
# Copyright (C) 2011-2013 Jack Polgar
#
# Blogaze is released under the BSD 3-clause license.
# http://opensource.org/licenses/BSD-3-Clause
#

module Blogaze
  module Controllers
    class Controller < Ramaze::Controller
      layout :default
      helper :xhtml, :maruku, :blue_form, :formatting
      engine :etanni

      ##
      # Sherlock: Initializer
      # Watson: No shit, Sherlock.
      #
      def initialize
        super

        # Get user info
        if session[:logged_in]
          @userinfo = ::Blogaze::Models::User[session[:user_id]]
        end

        # Get settings
        get_settings

        # Set theme
        Theme.use @settings[:theme]

        # Page title
        @title = [@settings[:title]]
      end

      ##
      # Adds the passed title to be added to the page title.
      #
      # @param [String] title
      #
      def title(title)
        @title.push title
      end

      ##
      # Renders the view with the set layout
      #
      # @param [String] path Path to view
      #
      def view_file(path)
        path = path.to_s if not path.is_a?(String)
        view_path = File.join(Theme.current.templates, "#{path}.xhtml")
        layout_path = File.join(Theme.current.templates + "/layouts/#{ancestral_trait[:layout]}.xhtml")
        return render_file(layout_path, :content => render_file(view_path))
      end

      ##
      # Load settings from the database.
      #
      def get_settings
        @settings = {}
        Blogaze.database[:settings].all.each do |setting|
          @settings[setting[:setting].to_sym] = setting[:value]
        end
      end
    end # Controller
  end # Controllers
end # Blogaze

# Here go your requires for subclasses of Controller:
Dir.glob(File.dirname(__FILE__) + '/*.rb').each do |controller|
  require(controller)
end

# Admin controllers
require __DIR__('admin/init')
