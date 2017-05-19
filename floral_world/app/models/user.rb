class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :products
  # validates :name, :surname, :nick, :email, presence: true
    has_attached_file :product_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: ":style/missing.png"
  
  validates_attachment_content_type :product_image, content_type: /\Aimage\/.*\z/
end
