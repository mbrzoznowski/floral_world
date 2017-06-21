class RemoveUnnecessaryColumnsFromTables < ActiveRecord::Migration[5.1]
  def change
    remove_column :materials, :color
    remove_column :products, :description
    remove_column :products, :price
  end
end
