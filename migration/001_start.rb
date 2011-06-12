Sequel.migration do
  up do
    create_table(:groups) do
      primary_key :id
      String :name, :size=>255
      Integer :is_admin
      Integer :create_posts
      Integer :edit_posts
      Integer :delete_posts
    end
    
    create_table(:posts) do
      primary_key :id
      String :title, :size=>255
      String :slug, :size=>255
      String :body, :text=>true
      Integer :user_id
      Integer :published_at
      Integer :created_at
      Integer :updated_at, :default=>0
    end
    
    create_table(:settings) do
      String :setting, :size=>255
      String :value, :text=>true
    end
    
    create_table(:users) do
      primary_key :id
      String :username, :size=>255
      String :password, :size=>255
      String :salt, :size=>255
      String :email, :size=>255
      String :group_id, :size=>255
    end
  end
  
  down do
    drop_table(:groups, :posts, :schema_info, :settings, :users)
  end
end