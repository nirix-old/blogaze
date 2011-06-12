class CreateGroupsTable < Sequel::Migration
  def up
    create_table :groups do
      primary_key :id
      String :name
      Integer :is_admin
      Integer :create_posts
      Integer :edit_posts
      Integer :delete_posts
    end
  end
  
  def down
    drop_table :groups
  end
end