class AddAmountToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :amount, :string
  end
end
