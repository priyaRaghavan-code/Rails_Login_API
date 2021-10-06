require 'rails_helper'
RSpec.describe "CartItemsController", type: :request do
  describe Api::V1::CartItemsController do
    let(:product) { create(:product) }
    let(:user) { create(:user) }

    it 'add the product to cart' do
        post '/api/v1/cart_items', params: { user_id: user.id, product_id:product.id}
        expect(response).to have_http_status(200)
    end

    it 'add the product to cart' do
      post '/api/v1/cart_items', params: { user_id: nil, product_id:product.id}
      expect(response).to have_http_status(:unauthorized)
    end
  end
end