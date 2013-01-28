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
      class Users < Controller
        map '/admin/users'

        before :edit, :save do
          title "Edit User"
          @groups = {}
          ::Blogaze::Models::Group.all.each do |group|
            @groups[group.id] = group.name
          end
        end

        def initialize
          super
          title "Users"
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
        # @param [Integer] user_id
        #
        def edit(user_id)
          @user = ::Blogaze::Models::User[user_id]
          respond(view_file('admin/users/edit'))
        end

        ##
        # Save user
        #
        # @param [Integer] user_id
        #
        def save(user_id)
          @user = ::Blogaze::Models::User[user_id]
          @user.username = request[:username]
          @user.email    = request[:email]
          @user.group_id = request[:group_id]

          # Validate data
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
        # @param [Integer] user_id
        #
        def delete(user_id)
          ::Blogaze::Models::User[user_id].delete
          flash[:success] = "User deleted successfully"
          redirect Users.r('/')
        end
      end # Users
    end # Admin
  end # Controllers
end # Blogaze
