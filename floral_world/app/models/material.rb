class Material < ApplicationRecord
  has_many :orders
  has_many :products, through: :orders

  validates :name, :price, presence: true
  validates :price, :numericality => {:greater_than_or_equal_to => 0}
end
