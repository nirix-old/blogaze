#
# Blogaze
# Copyright (C) 2011-2013 Jack Polgar
#
# Blogaze is released under the BSD 3-clause license.
# @license http://opensource.org/licenses/BSD-3-Clause
#

module Blogaze
  module Admin
    class Comments < Controller
      map '/admin/comments'

      def index
        @comments = Comment.all
        respond(view_file('admin/comments/index'))
      end

      def approve(comment_id)
        Comment[comment_id].update(:in_moderation => 0).save
        flash[:success] = "Comment approved"
        redirect r('/')
      end

      def delete(comment_id)
        Comment[comment_id].delete
        flash[:success] = "Comment deleted"
        redirect r('/')
      end
    end
  end
end
