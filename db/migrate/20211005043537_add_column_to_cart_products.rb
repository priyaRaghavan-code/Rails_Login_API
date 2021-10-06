class AddColumnToCartProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :cart_products, :price, :decimal
    add_column :cart_products, :quantity, :integer
  end
end
