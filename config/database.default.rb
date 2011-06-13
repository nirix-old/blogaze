#
# Blogaze
# Copyright (C) 2011 Jack Polgar
#
# Blogaze is released under the BSD 3-clause license.
#

DB = Sequel.connect(
  :adapter  => 'mysql2',
  :host     => 'localhost',
  :username => '',
  :password => '',
  :database => '',
  :test     => true,
  :encoding => 'utf8',
  :charset => 'utf8_general_ci'
)