module Api
	module V1
		class CartItemsController < ApplicationController

			def create
				chosen_product = Product.find(params[:product_id])
				# cart_item = CartItem.create(cart_item_params)
				# chosen_product.cart_items << CartItem.new()

        result = Cart::Actions::AddToCart.run(
          chosen_product,
          cart_item_params
        )
        if result.success?
          render json: {token: result.fixtures['cart_item'], status: :ok}
        else
          render json: { error: result.message }, status: :unauthorized
        end

			end

			def add_quantity
				cart_item = CartItem.find(params[:id])
				cart_item.increment!(:quantity)
				render json: {status: "Success", message: "Quantity incremented Successfully", data:chosen_product}
			end

			def reduce_quantity
				cart_item = CartItem.find(params[:id])
				cart_item.decrement!(:quantity)
				render json: {status: "Success", message: "Quantity decremented Successfully", data:chosen_product}
			end

			private 
			def cart_item_params
				params.permit(:user_id, :quantity, :total)
			end

		end
	end
end