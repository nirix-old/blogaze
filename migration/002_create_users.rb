class CreateUsersTable < Sequel::Migration
  def up
    create_table :users do
      primary_key :id
      String :username
      String :password
      String :salt
      String :email
      String :group_id
    end
  end
  
  def down
    drop_table :users
  end
end