class Order < ApplicationRecord
  belongs_to :material
  belongs_to :product


  validates :material_id, :amount, :product_id, presence: true
  validates :amount, :numericality => { :only_integer => true }

end
