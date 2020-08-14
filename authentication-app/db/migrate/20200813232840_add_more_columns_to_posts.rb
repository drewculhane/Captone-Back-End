class AddMoreColumnsToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :user_avatar, :string 
    add_column :posts, :user_display, :string 
  end
end
