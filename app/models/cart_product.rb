class CartProduct < ApplicationRecord
  belongs_to :product
  belongs_to :cart_item
end
