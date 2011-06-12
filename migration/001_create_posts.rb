class CreatePostsTable < Sequel::Migration
  def up
    create_table :posts do 
      primary_key :id
      String :title
      String :slug
      String :body, :text => true
      Integer :user_id
      Integer :published_at
      Integer :created_at
      Integer :updated_at, :default => 0
    end
  end
  
  def down
    drop_table :posts
  end
end