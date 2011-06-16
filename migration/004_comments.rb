Sequel.migration do
  up do
    create_table :comments do
      primary_key :id
      String :author
      String :body, :text => true
      Integer :post_id
      Integer :created_at
      Integer :published_at, :default => 0
    end
  end
  
  down do
    drop_table :comments
  end
end