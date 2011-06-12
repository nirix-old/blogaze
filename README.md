Blogaze
========

Simple blog powered by the Ramaze ruby framework.

Installation
------------

You'll need to install Ramaze, you can do so by running `gem install ramaze`, 
next you'll want to install the required gems, run `bundle install`, hopefully that works.

Now you need to setup the database, rename the `config/database.default.rb` to `config/database.rb` 
and set your database username, password, server and database name.

Now you need to create the tables and such with the Sequel migration thing:

`sequel -m migration mysql2://user:pass@server/dbname`

Obviously you want to change the `user`, `pass`, `server` and `dbname` to the actual values.

Why
------

There's two reasons why I've made Blogaze, the first is that I cant stand using PHP anymore
the second is that because I no longer want to use PHP, I need a non-php blog.