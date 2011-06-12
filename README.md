Blogaze
========

Simple blog powered by the Ramaze ruby framework.

Installation
------------

**NOT COMPLETE**

Install Ramaze

`gem install ramaze`

Go to the directory you have the Blogaze code in

1. Setup the database (this is for sqlite)

   `sequel -m migration sqlite://db/sqlite.db`

2. Start Ramaze

  `ramaze start`

3. Optional but recommended

  `sudo rm -rf /usr/bin/php` 

Why
------

There's two reasons why I've made Blogaze, the first is that I cant stand using PHP anymore
the second is that because I no longer want to use PHP, I need a non-php blog.