class AddForeignKeyForPersonalOrders < ActiveRecord::Migration[5.1]
  def up
    add_foreign_key :personal_orders, :orders
  end

  def down
    remove_foreign_key :personal_orders, column: :order_id
  end
end
