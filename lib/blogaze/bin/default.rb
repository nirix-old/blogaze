#
# Blogaze
# Copyright (C) 2011-2013 Jack Polgar
#
# Blogaze is released under the BSD 3-clause license.
# http://opensource.org/licenses/BSD-3-Clause
#

module Blogaze
  module Bin
    class Default < Shebang::Command
      command :default
      banner  'Blogaze is a simple blog powered by Ramaze.'
      usage   'blogaze [COMMAND]'

      o :h, :help   , 'Shows this help message'  , :method => :help
      o :v, :version, 'Shows the current version', :method => :version

      ##
      # Lists commands.
      #
      def initialize
        super
      end

      ##
      # Shows help
      #
      def index
        help
      end

      ##
      # Help message
      #
      def help
        puts @option_parser
        puts
        puts "Commands"
        puts "  create [NAME]    Create a Blogaze installation in [NAME] directory."
        puts
      end

      protected

      ##
      # Shows version
      #
      def version
        puts Blogaze::VERSION
        exit
      end
    end
  end
end
