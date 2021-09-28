require 'rails_helper'
RSpec.describe "ProductsController", type: :request do
  describe Api::V1::ProductsController do
    let(:product) { create(:product) }

      it 'creates the product' do
        post '/api/v1/products', params: { name:product.name , price: product.price , description:product.description, image:product.image}
        expect(response).to have_http_status(200)
      end

      it 'validates the presence of paramters' do
        product = Product.create(name:nil)
        expect(product).to_not be_valid
      end

  end 
end