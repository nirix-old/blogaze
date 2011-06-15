Blogaze
========

Simple blog powered by the Ramaze ruby framework.

Todo
------

Things that still need to be done.

1. Post tags
2. Post comments
3. Settings page
4. User manager
5. Profile manager

Installation
------------

### Install Ramaze ###

You'll need to install Ramaze, you can do so by running `gem install ramaze`, 
next you'll want to install the required gems, run `bundle install`, hopefully that works.

### Configuration ###

Rename the `config.default.rb` and `database.default.rb` files to `config.rb` and `database.rb`
in the `config` directory.

Open the `database.rb` file and enter your database information.

### The database tables and data ###

Now you need to setup the database, run `sequel -m migration mysql2://user:pass@server/dbname`
that will create the database tables, now to load the default data, run `rake defaultdata`.

*Note: you want to change the `user`, `pass`, `server` and `dbname` to the actual values.*

The default username is `Admin` and the password is `myadmin`.

### Running this thing ###

Now all that's left is to pretty much start it up with your favourite server, I recommend [Thin](http://code.macournoyer.com/thin/).

Once you have Thin installed, run `thin -R config.ru start`, if you want to run this on a domain
you will need to setup a proxy from your web server, I recommend [NGiNX](http://nginx.org).

Why
------

There's two reasons why I've made Blogaze, the first is that I cant stand using PHP anymore
the second is that because I no longer want to use PHP, I need a non-php blog.

Gem?
------

Not yet, once this thing is actually _stable_ then there _may_ be a gem.