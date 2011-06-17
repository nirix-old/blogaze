#
# Blogaze
# Copyright (C) 2011 Jack Polgar
#
# Blogaze is released under the BSD 3-clause license.
#

Sequel.extension :pagination
Sequel::Model.plugin :validation_class_methods
Sequel::Model.plugin :schema
Sequel::Model.plugin :hook_class_methods

# Here go your requires for models:
Dir.glob(File.dirname(__FILE__) + '/*.rb').each do |model|
  require(model)
end