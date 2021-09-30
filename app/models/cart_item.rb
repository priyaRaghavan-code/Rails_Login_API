class CartItem < ApplicationRecord
  belongs_to :user

  def total_price
    self.quantity * self.product.price
  end
  
end
