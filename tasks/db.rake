#
# Blogaze
# Copyright (C) 2013 Jack Polgar
#
# Blogaze is released under the BSD 3-clause license.
#

require 'sequel'
Sequel.extension(:migration)

require File.expand_path(File.dirname(__FILE__)) + '/../config/database'

namespace :db do
  desc 'Migrates the database to the most recent version'
  task :migrate do
    Sequel::Migrator.run(DB, File.expand_path('../../db/migration', __FILE__))
  end

  desc 'Inserts default data into the database'
  task :defaults do
    # Insert settings
    puts "Inserting settings"
    settings = DB[:settings]
    settings.insert(:setting => 'title', :value => 'Blogaze')
    settings.insert(:setting => 'posts_per_page', :value => 5)
    settings.insert(:setting => 'moderate_comments', :value => 1)
    settings.insert(:setting => 'theme', :value => 'default')

    # Insert groups
    puts "Inserting groups"
    groups = DB[:groups]
    groups.insert(:name => 'Admin', :is_admin => 1, :create_posts => 1, :edit_posts => 1, :delete_posts => 1)
    groups.insert(:name => 'Author', :is_admin => 0, :create_posts => 1, :edit_posts => 1, :delete_posts => 1)
    groups.insert(:name => 'Reader', :is_admin => 0, :create_posts => 0, :edit_posts => 0, :delete_posts => 0)

    # Admin user
    puts "Creating admin user"
    DB[:users].insert(:username => 'Admin', :password => 'bc750014cb3cf5a86b4851b9ca33027537b3fb85', :email => 'admin@example.com', :group_id => '1')

    # First post
    DB[:posts].insert(:title => 'Welcome', :slug => 'welcome', :body => '**Welcome** to _Blogaze!_', :published_at => Time.now.to_i, :created_at => Time.now.to_i, :user_id => 1)

    puts "Done"
  end
end
