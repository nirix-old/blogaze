Blogaze
========

Simple blog powered by the Ramaze ruby framework.

Installation
------------

**NOT COMPLETE**

Install Ramaze

`gem install ramaze`

Go to the directory you have the Blogaze in

1. Run `bundle install`, this should install the required gems.

2. Setup the database in the `config/database.rb` file (rename database.default.rb)

   `sequel -m migration mysql2://user:pass@localhost/database_name`

3. Start Ramaze

  `ramaze start` unless you want to use something else, I recommend using Thin.

Why
------

There's two reasons why I've made Blogaze, the first is that I cant stand using PHP anymore
the second is that because I no longer want to use PHP, I need a non-php blog.