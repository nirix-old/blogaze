#
# Blogaze
# Copyright (C) 2011-2013 Jack Polgar
#
# Blogaze is released under the BSD 3-clause license.
# http://opensource.org/licenses/BSD-3-Clause
#

module Blogaze
  ##
  # Theme class
  #
  class Theme
    attr_accessor :name
    attr_accessor :templates

    # Registered themes
    REGISTERED = {}

    ##
    # Sets the themes name as a symbol
    #
    # @param [String] name Themes name
    #
    def name=(name)
      @name = name.to_sym
    end

    class << self
      attr_accessor :current

      ##
      # Adds a new theme
      #
      # @yield theme
      #
      def add
        theme = self.new
        yield theme
        REGISTERED[theme.name] = theme
      end

      ##
      # Returns the theme matching the supplied name.
      #
      # @param [String] name Themes name
      #
      def [](name)
        name = name.to_sym
        raise("Invalid theme #{name}") unless REGISTERED.key?(name)
        return REGISTERED[name]
      end

      ##
      # Sets the supplied name as the
      # current theme to be used.
      #
      # @param [String] name Themes name
      #
      def use(name)
        name = name.to_sym
        raise("Unable to use theme #{name}: not registered") unless REGISTERED.key?(name)
        @current = REGISTERED[name]
      end

      ##
      # Returns the registered themes.
      #
      # @return [Array]
      #
      def registered
        REGISTERED.to_a
      end
    end # Self
  end # Theme
end # Blogaze
