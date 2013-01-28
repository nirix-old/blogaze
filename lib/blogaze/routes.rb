#
# Blogaze
# Copyright (C) 2011-2013 Jack Polgar
#
# Blogaze is released under the BSD 3-clause license.
# http://opensource.org/licenses/BSD-3-Clause
#

module Blogaze
  # Admin routes
  ::Ramaze::Route[/\/admin(.*)/] = '/admin%s'

  # Post routes
  ::Ramaze::Route[/^\/[0-9]+\/[0-9]+\/([\w\.\-]+)$/] = '/posts/view/%s'
  ::Ramaze::Route[/\/page\/([0-9]+)/] = '/%d'

  # Tag routes
  ::Ramaze::Route[/^\/tags\/([\w]+)$/] = '/posts/tag/%s'
  #::Ramaze::Route[/^\/tags\/([\w]+)\/page\/([0-9]+)$/] = '/posts/tag/%s/%d'

  # User routes
  ::Ramaze::Route['/login'] = '/sessions/new'
  ::Ramaze::Route['/logout'] = '/sessions/destroy'
  ::Ramaze::Route['/register'] = '/users/new'
  ::Ramaze::Route['/users/create'] = '/users/create'
  ::Ramaze::Route['/profile'] = '/users/profile'
  ::Ramaze::Route[/\/sessions(.*)/] = '/sessions%s'

  # Page routes
  ::Ramaze::Route[/^\/([a-zA-Z]+)$/] = '/pages/view'
end
