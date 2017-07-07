class CreatePersonalOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :personal_orders do |t|
      t.string :name
      t.string :order
      t.integer :price
      t.integer :order_id
      t.timestamps
      t.index :order_id
    end
  end
end
