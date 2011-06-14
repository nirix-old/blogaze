#
# Blogaze
# Copyright (C) 2011 Jack Polgar
#
# Blogaze is released under the BSD 3-clause license.
#

module Admin
  class Pages < Controller
    map '/admin/pages'
    
    def index
      @pages = Page.order(:title.asc).all
    end
    
    def new
      @title = "New Page - Pages - Admin - #{@settings[:title]}"
      @page = Page.new
    end
    
    def create
      @title = "New Page - Pages - Admin - #{@settings[:title]}"
      data = {
        :title => request[:title],
        :slug => request[:slug],
        :body => request[:body],
        :on_menu => request[:on_menu]
      }
      
      @page = Page.new(data)
      
      if @page.valid?
        @page.save
        flash[:success] = "Page created successfully"
        redirect Pages.r('/')
      else
        return render_view :new
      end
    end
    
    def edit(page_id)
      @title = "Edit Page - Pages - Admin - #{@settings[:title]}"
      @page = Page[page_id]
    end
    
    def save(page_id)
      @title = "Edit Page - Pages - Admin - #{@settings[:title]}"
      @page = Page[page_id]
      @page.title = request[:title]
      @page.slug = request[:slug]
      @page.body = request[:body]
      @page.on_menu = request[:on_menu]
      
      if @page.valid?
        @page.save
        flash[:success] = "Page saved successfully"
        redirect Pages.r('/')
      else
        render_view :edit
      end
    end
    
    def delete(page_id)
      Page[page_id].delete
      flash[:success] = "Page deleted successfully"
      redirect Pages.r('/')
    end
  end
end