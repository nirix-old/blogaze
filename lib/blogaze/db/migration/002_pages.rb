Sequel.migration do
  up do
    create_table :pages do
      primary_key :id
      String :title
      String :slug
      String :body, :text => true
      Integer :created_at
      Integer :updated_at, :default => 0
    end
  end
  
  down do
    drop_table :pages
  end
end