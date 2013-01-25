#
# Blogaze
# Copyright (C) 2011-2013 Jack Polgar
#
# Blogaze is released under the BSD 3-clause license.
# @license http://opensource.org/licenses/BSD-3-Clause
#

require 'blogaze'

require __DIR__('config/config')
require __DIR__('config/database')
require __DIR__('themes/default')

Blogaze.start
