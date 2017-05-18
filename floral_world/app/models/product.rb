class Product < ApplicationRecord
  has_many :orders
  has_many :materials, through: :orders

  validates :name, uniqueness: true

  def generate_description

  end

  def generate_price
    result = 0
    result = 0
      orders.each do |order|
        result += (order.material.price * order.amount)
      end 
    result
  end

  def generate_simple_desc
    opis = []
    result = ""
      orders.each do |order|
        opis_order = []
        opis_order << "#{order.material.name} sztuk: "
        opis_order << "#{order.amount}; "
        opis << opis_order
    end
      opis.each do |parse|
        result << parse.join(' ')
      end
      result[0..40]
  end

end
