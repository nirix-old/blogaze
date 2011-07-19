Sequel.migration do
  up do
    create_table :tags do
      primary_key :id
      String :name
      String :slug
    end
    
    create_table :tags_relationships do
      primary_key :id
      Integer :tag_id
      Integer :object_id
      String :object_type
    end
  end
  
  down do
    drop_table :tags, :tags_relationships
  end
end