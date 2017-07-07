class RenameOrderColumn < ActiveRecord::Migration[5.1]
  def up
    rename_column :personal_orders, :order, :items
  end

  def down
    rename_column :personal_orders, :items, :order
  end
end
