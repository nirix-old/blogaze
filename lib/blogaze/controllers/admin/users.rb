#
# Blogaze
# Copyright (C) 2011-2013 Jack Polgar
#
# Blogaze is released under the BSD 3-clause license.
# @license http://opensource.org/licenses/BSD-3-Clause
#

module Blogaze
  module Controllers
    module Admin
      class Users < Controller
        map '/admin/users'

        before :edit, :save do
          @groups = {}
          ::Blogaze::Models::Group.all.each do |group|
            @groups[group.id] = group.name
          end
        end

        ##
        # Lists users
        #
        def index
          @users = ::Blogaze::Models::User.all
          respond(view_file('admin/users/index'))
        end

        ##
        # Edit user form
        #
        def edit(id)
          @user = ::Blogaze::Models::User[id]
          respond(view_file('admin/users/edit'))
        end

        ##
        # Save user
        #
        def save(id)
          @user = ::Blogaze::Models::User[id]
          @user.username = request[:username]
          @user.email    = request[:email]
          @user.group_id = request[:group_id]

          if @user.valid?
            @user.save
            flash[:success] = "User saved successfully"
            redirect Users.r('/')
          end

          respond(view_file('admin/users/edit'))
        end

        ##
        # Delete user
        #
        def delete(id)
          ::Blogaze::Models::User[id].delete
          flash[:success] = "User deleted successfully"
          redirect Users.r('/')
        end
      end # Users
    end # Admin
  end # Controllers
end # Blogaze
