class Product < ApplicationRecord
  has_many :orders
  has_many :materials, through: :orders

  validates :name, uniqueness: true
  # validates :name, format: { with: /\A[a-zA-Z]+\z/,
  #   message: "only allows letters" }
end
