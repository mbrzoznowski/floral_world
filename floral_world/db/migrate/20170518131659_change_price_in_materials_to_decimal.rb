class ChangePriceInMaterialsToDecimal < ActiveRecord::Migration[5.1]
  def change
    change_column :materials, :price, :decimal, precision: 7, scale: 2
  end
end
