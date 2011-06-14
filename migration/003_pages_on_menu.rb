Sequel.migration do
  up do
    alter_table :pages do
      add_column :on_menu, Integer, :default => 1
    end
  end
  
  down do
    alter_table :pages do
      drop_column :on_menu
    end
  end
end