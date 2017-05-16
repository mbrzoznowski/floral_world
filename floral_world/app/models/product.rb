class Product < ApplicationRecord
  has_many :orders
  has_many :materials, through: :orders
end
