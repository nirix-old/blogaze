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
    
    if !@page.respond_to?('title')
      render_file 'view/pages/notfound.xhtml'
    else
      render_file 'view/pages/page.xhtml'
    end
  end
end