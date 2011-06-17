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
    
    # Chomp chomp chomp, let's trim any unwanted
    # forward slashes from the begning and end of the url.
    slug = slug.chomp("/").reverse.chomp("/").reverse
    
    @page = Page[:slug => slug]
    
    # Check if the page exists, if not render the
    # not found page.
    if !@page.respond_to?('title')
      return render_view :notfound
    else
      @title = "#{@page.title} - #{@settings[:title]}"
      return render_view :page
    end
  end
end