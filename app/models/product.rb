class Product < ApplicationRecord
  has_many :cart_products
  has_many :cart_items, through: :cart_products

  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true
  # has_one_attached :image
  validates :image, presence: true


  # def image_url
  #     image.attached? ? url_for(image) : nil
  # end

end