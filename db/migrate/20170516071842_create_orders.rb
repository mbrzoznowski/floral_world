class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :material_id
      t.integer :product_id

      t.timestamps
    end
  end
end
