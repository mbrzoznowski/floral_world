class CreateProductsUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :products_users do |t|
      t.belongs_to :product, index: true
      t.belongs_to :user, index: true
    end
  end
end
