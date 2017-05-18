class AddColorToMaterials < ActiveRecord::Migration[5.1]
  def change
    add_column :materials, :color, :string
  end
end
