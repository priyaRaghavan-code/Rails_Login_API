module Api
  module V1
    class CartItemsController < ApplicationController

        def create
            chosen_product = Product.find_by(params[:product_id])
            result = Cart::Actions::AddToCart.run(
              cart_item_params,
              chosen_product
            )

            if result.success?
              render json: {token: result.fixtures['cart_item'], status: :ok}
            else
              render json: { error: result.message }, status: :unauthorized
            end
        end


        private

        def cart_item_params
          params.permit(:user_id)
        end
    end
      
  end
end