#
# Blogaze
# Copyright (C) 2011-2013 Jack Polgar
#
# Blogaze is released under the BSD 3-clause license.
# http://opensource.org/licenses/BSD-3-Clause
#

module Blogaze
  module Controllers
    class Posts < Controller
      map '/posts'
      helper :paginate

      ##
      # View post
      #
      # @param [String] slug Post slug
      #
      def view(slug)
        @post = ::Blogaze::Models::Post.filter(:slug => slug).first
        return respond(view_file('pages/notfound')) if @post.nil?

        # Set title
        title @post.title

        # Instead of a controller just for comment creation
        # let's just put it here, that way we can display
        # errors with the new comment form.
        if request[:new_comment].to_i == 1
          data = {
            :post_id => @post.id,
            :author => request[:author],
            :body => request[:body],
            :in_moderation => @settings[:moderate_comments]
          }
          @comment = ::Blogaze::Models::Comment.new(data)
          if @comment.valid?
            @comment.save
            flash[:success] = "Your comment has been posted"
            redirect @post.href
          end
        else
          @comment = ::Blogaze::Models::Comment.new
        end

        respond(view_file('posts/view'))
      end

      ##
      # Lists posts belonging to the tag.
      #
      # @param [String]  slug Tag slug
      # @param [Integer] page Page number
      #
      def tag(slug, page = 1)
        @tag = ::Blogaze::Models::Tag[:slug => slug]
        return respond(view_file('pages/notfound')) if @tag.nil?

        # Set title
        title "Posts tagged #{@tag.name}"

        # Get relationships with posts and put the post IDs
        # into an array for use when selecting posts to be
        # paginated.
        post_ids = []
        relations = ::Blogaze::Models::TagsRelationship.where(:object_type => 'post', :tag_id => @tag.id)
        relations.each do |rel|
          # Due to object_id being a Ruby method, we need to
          # get the object ID the alternative way.
          post_ids.push rel[:object_id]
        end

        puts post_ids

        # Get the data and paginate it.
        data = ::Blogaze::Models::Post.where(:id => post_ids).order(:published_at.desc)
        puts data.sql
        @posts = paginate(data, :limit => @settings[:posts_per_page].to_i, :page => page.to_i)

        respond(view_file(:index))
      end
    end # Posts
  end # Controllers
end # Blogaze
