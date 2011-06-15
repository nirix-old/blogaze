#encoding: utf-8
#
# Blogaze
# Copyright (C) 2011 Jack Polgar
#
# Blogaze is released under the BSD 3-clause license.
#

class MainController < Controller
  helper :paginate
  
  def index(page = 1)
    if page.to_i > 1
      @title = "Page #{page} - #{@settings[:title]}"
    else
      @title = @settings[:title]
    end
    #@posts = Post.order(:id.desc).limit 10
    
    data = Post.order(:published_at.desc)
    @posts = paginate(data, :limit => @settings[:posts_per_page].to_i, :page => page.to_i)
  end
end
