# Here goes your database connection and options:
require 'sequel'
require 'sequel/extensions/inflector'
DB = Sequel.sqlite("#{__DIR__}/../db/blog.sqlite")

Sequel.extension :pagination
Sequel::Model.plugin :validation_class_methods
Sequel::Model.plugin :schema
Sequel::Model.plugin :hook_class_methods

# Here go your requires for models:
# require __DIR__('user')
require __DIR__('post');