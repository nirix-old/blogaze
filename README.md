Blogaze
========

Simple blog powered by the Ramaze framework.

WARNING
-------

Blogaze is currently in development, use at your own risk.

Setup
------

1. Rename the config files in the `config` directory to remove `.default` from the filenames.
2. Enter your database information in the `config/database.rb` file.
3. Run `rake db:migrate` and `rake db:defaults`
4. Run `ruby start.rb` or `thin start` or whatever your preferred way is.

The default admin account username is `admin` and the password is `myadmin`.

Todo
------

Things that still need to be done.

1. Post tags
2. User manager
3. Profile manager

Gem?
------

Someday.
