class AddMoreColumnsToComments < ActiveRecord::Migration[6.0]
    def change
      add_column :comments, :user_avatar, :string 
      add_column :comments, :user_display, :string 
    end
  end
