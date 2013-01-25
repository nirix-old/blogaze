#
# Blogaze
# Copyright (C) 2011-2013 Jack Polgar
#
# Blogaze is released under the BSD 3-clause license.
# @license http://opensource.org/licenses/BSD-3-Clause
#

module Blogaze
  class Theme
    attr_accessor :name
    attr_accessor :templates

    REGISTERED = {}

    def name=(name)
      @name = name.to_sym
    end

    class << self
      attr_accessor :current

      def add
        theme = self.new
        yield theme
        REGISTERED[theme.name] = theme
      end

      def [](name)
        name = name.to_sym
        raise("Invalid theme #{name}") unless REGISTERED.key?(name)
        return REGISTERED[name]
      end

      def use(name)
        name = name.to_sym
        raise("Unable to use theme #{name}: not registered") unless REGISTERED.key?(name)
        @current = REGISTERED[name]
      end

      def registered
        REGISTERED.to_a
      end
    end # Self
  end # Theme
end # Blogaze
