class RenameColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :cart_items, :status_key, :status
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
