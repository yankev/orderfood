class ChangeTypeOfColumn < ActiveRecord::Migration[5.1]
  def up
    change_column :personal_orders, :price, :decimal
  end
  def down
    change_column :personal_orders, :price, :integer
  end
end
