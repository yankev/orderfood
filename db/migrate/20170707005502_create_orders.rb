class CreateOrders < ActiveRecord::Migration[5.1]
  def up
    create_table :orders do |t|
      t.string :restaurant, limit: 100
      t.string :menu_url, limit: 200
      t.integer :tax
      t.integer :tip
      t.datetime :deadline

      t.timestamps
    end
  end

  def down
    drop_table :orders
  end
end
