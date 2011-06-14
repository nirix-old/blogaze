#
# Blogaze
# Copyright (C) 2011 Jack Polgar
#
# Blogaze is released under the BSD 3-clause license.
#

class Pages < Controller
  def view(slug = nil)
    if slug == nil
      slug = request.env["REQUEST_PATH"]
    end
    slug = slug.chomp("/").reverse.chomp("/").reverse
    
    @page = Page[:slug => slug]
    
    @slug = slug
    
    if !@page.respond_to?('title')
      return render_view :notfound
    else
      return render_view :page
    end
  end
end