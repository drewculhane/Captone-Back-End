class AddMoreColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :avatar, :string 
    add_column :users, :nickname, :string 
    add_column :users, :spec, :string 
    add_column :users, :server_region, :string
    add_column :users, :server, :string 
  end
end
