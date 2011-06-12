class PostsController < Controller
  def view(slug)
    @post = Post.filter(:slug => slug).first
    @title = @post.title + ' - ' + @settings[:title]
  end
end