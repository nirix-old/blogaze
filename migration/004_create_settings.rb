class CreateSettingsTable < Sequel::Migration
  def up
    create_table :settings do
      String :setting
      String :value, :text => true
    end
  end
  
  def down
    drop_table :settings
  end
end