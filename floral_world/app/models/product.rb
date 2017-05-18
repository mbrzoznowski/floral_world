class Product < ApplicationRecord
  has_many :orders
  has_many :materials, through: :orders
  has_attached_file :product_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: ":style/missing.png"
  
  validates_attachment_content_type :product_image, content_type: /\Aimage\/.*\z/
  validates :name, presence: true

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
