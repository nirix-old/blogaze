#
# Blogaze
# Copyright (C) 2011-2013 Jack Polgar
#
# Blogaze is released under the BSD 3-clause license.
# @license http://opensource.org/licenses/BSD-3-Clause
#

module Blogaze
  module Admin
    class Pages < Controller
      map '/admin/pages'

      def index
        @pages = Page.order(:title.asc).all
        respond(view_file('admin/pages/index'))
      end

      def new
        @title = "New Page - Pages - Admin - #{@settings[:title]}"
        @page = Page.new
        respond(view_file('admin/pages/new'))
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
          respond(view_file('admin/pages/new'))
        end
      end

      def edit(page_id)
        @title = "Edit Page - Pages - Admin - #{@settings[:title]}"
        @page = Page[page_id]
        respond(view_file('admin/pages/edit'))
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
          respond(view_file('admin/pages/edit'))
        end
      end

      def delete(page_id)
        Page[page_id].delete
        flash[:success] = "Page deleted successfully"
        redirect Pages.r('/')
      end
    end
  end
end
