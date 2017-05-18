class AddForeignKeyToProducts < ActiveRecord::Migration[5.1]
  def change
    add_index :products, :user_id
    add_foreign_key :products, :users
  end
end
