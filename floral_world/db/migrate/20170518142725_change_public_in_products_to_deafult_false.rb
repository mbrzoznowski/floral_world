class ChangePublicInProductsToDeafultFalse < ActiveRecord::Migration[5.1]
  def change
    change_column :products, :public, :boolean, :default => false
  end
end
