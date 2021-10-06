class RemoveColumnFromCartItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :cart_items, :total
    remove_column :cart_items, :quantity
  end
end
