#
# Blogaze
# Copyright (C) 2011 Jack Polgar
#
# Blogaze is released under the BSD 3-clause license.
#

Ramaze::Route[/\/admin(.*)/] = '/admin%s'

Ramaze::Route['view post'] = lambda do |path, request|
  if path =~ /\/[0-9]+\/[0-9]+\/([\w\.\-]+)/
    return "/posts/view/#{$1}"
  end
end

Ramaze::Route['/register'] = '/users/new'
Ramaze::Route['/login'] = '/sessions/new'