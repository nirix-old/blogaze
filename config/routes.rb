#
# Blogaze
# Copyright (C) 2013 Jack Polgar
#
# Blogaze is released under the BSD 3-clause license.
#

# Admin routes
Ramaze::Route[/\/admin(.*)/] = '/admin%s'

# Post routes
Ramaze::Route[/^\/[0-9]+\/[0-9]+\/([\w\.\-]+)$/] = '/posts/view/%s'
Ramaze::Route[/\/page\/([0-9]+)/] = '/%d'

# User routes
Ramaze::Route['/login'] = '/sessions/new'
Ramaze::Route['/logout'] = '/sessions/destroy'
Ramaze::Route['/register'] = '/users/new'
Ramaze::Route['/users/create'] = '/users/create'
Ramaze::Route[/\/sessions(.*)/] = '/sessions%s'

# Page routes
Ramaze::Route[/^\/([a-zA-Z]+)$/] = '/pages/view'
