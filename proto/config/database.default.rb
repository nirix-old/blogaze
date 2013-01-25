#
# Blogaze
# Copyright (C) 2011-2013 Jack Polgar
#
# Blogaze is released under the BSD 3-clause license.
# @license http://opensource.org/licenses/BSD-3-Clause
#

# The database connection
# set your server, username, password
# and database name below.
Blogaze.database = Sequel.connect(
  :adapter  => 'mysql2',
  :host     => 'localhost',
  :username => '',
  :password => '',
  :database => '',
  :test     => true,
  :encoding => 'utf8',
  :charset => 'utf8_general_ci'
)
