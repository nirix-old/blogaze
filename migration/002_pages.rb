class AddPagesTable < Sequel::Migration
  def up
    create_table :pages do
      primary_key :id
      String :title
      String :slug
      String :body, :text => true
      Integer :created_at
      Integer :updated_at, :default => 0
    end
  end
  
  def down
    drop_table :pages
  end
end