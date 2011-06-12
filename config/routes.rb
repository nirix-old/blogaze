#Ramaze::Route[/\/[0-9]+\/[0-9]+\/([\w\.\-]+)/] = '/posts/view/%s' #GOOD
#Ramaze::Route[/([0-9]+)/([0-9]+)/([\w]+)/] = '/posts/view/%s' #BAD

Ramaze::Route[/\/admin(.*)/] = '/admin%s'

Ramaze::Route['view post'] = lambda do |path, request|
  if path =~ /\/[0-9]+\/[0-9]+\/([\w\.\-]+)/
    return "/posts/view/#{$1}"
  end
end

Ramaze::Route['/register'] = '/users/new'