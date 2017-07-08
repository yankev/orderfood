class AddUserToPersonalOrders < ActiveRecord::Migration[5.1]
  def change
    add_reference :personal_orders, :user, foreign_key: true
  end
end
