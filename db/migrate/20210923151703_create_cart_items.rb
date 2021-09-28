class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.references :user, null: false, foreign_key: true
      t.decimal :total
      t.boolean :status_key
      t.integer :quantity

      t.timestamps
    end
  end
end
