#
# Blogaze
# Copyright (C) 2011-2013 Jack Polgar
#
# Blogaze is released under the BSD 3-clause license.
# http://opensource.org/licenses/BSD-3-Clause
#

module Blogaze
  module Controllers
    module Admin
      class Pages < Controller
        map '/admin/pages'

        def initialize
          super

          # Set title
          title "Pages"
        end

        ##
        # Page listing
        #
        def index
          @pages = ::Blogaze::Models::Page.order(:title.asc).all
          respond(view_file('admin/pages/index'))
        end

        ##
        # New page form
        #
        def new
          title "New Page"
          @page = ::Blogaze::Models::Page.new
          respond(view_file('admin/pages/new'))
        end

        ##
        # Create page
        #
        def create
          title "New Page"
          data = {
            :title => request[:title],
            :slug => request[:slug],
            :body => request[:body],
            :on_menu => request[:on_menu]
          }

          @page = ::Blogaze::Models::Page.new(data)

          if @page.valid?
            @page.save
            flash[:success] = "Page created successfully"
            redirect Pages.r('/')
          else
            respond(view_file('admin/pages/new'))
          end
        end

        ##
        # Edit page
        #
        # @param [Integer] page_id
        #
        def edit(page_id)
          title "Edit Page"
          @page = ::Blogaze::Models::Page[page_id]
          respond(view_file('admin/pages/edit'))
        end

        ##
        # Save page
        #
        # @param [Integer] page_id
        #
        def save(page_id)
          title "Edit Page"
          @page = ::Blogaze::Models::Page[page_id]
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

        ##
        # Delete page
        #
        # @param [Integer] page_id
        #
        def delete(page_id)
          P::Blogaze::Models::age[page_id].delete
          flash[:success] = "Page deleted successfully"
          redirect Pages.r('/')
        end
      end # Pages
    end # Admin
  end # Controllers
end # Blogaze
