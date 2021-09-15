class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.decimal :sub_total,null: false, precision:15, scale:2

      t.timestamps
    end
  end
end
