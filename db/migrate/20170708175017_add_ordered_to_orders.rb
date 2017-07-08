class AddOrderedToOrders < ActiveRecord::Migration[5.1]
  def up
    add_column :orders, :ordered, :boolean
  end
  def down
    remove_column :orders, :ordered
  end
end
