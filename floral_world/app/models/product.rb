class Product < ApplicationRecord
  has_many :orders
  has_many :materials, through: :orders
  belongs_to :user
  
  has_attached_file :product_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: ":style/missing.png"
  
  validates_attachment_content_type :product_image, content_type: /\Aimage\/.*\z/
  validates :name, presence: true

  def generate_price
    result = 0
    result = 0
      orders.each do |order|
        result += (order.material.price * order.amount)
      end 
    result
  end

  def generate_simple_desc
    description = []
    result = ""
      orders.each do |order|
        description_order = []
        description_order << "#{order.material.name} sztuk: "
        description_order << "#{order.amount}; "
        description << description_order
    end
      description.each do |parse|
        result << parse.join(' ')
      end
      result[0..40]
  end

end
