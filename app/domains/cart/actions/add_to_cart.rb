module Cart
  module Actions
    class AddToCart < Actionable::Action
      step :build
      step :create
      # step :verify

      def initialize(
        chosen_product,
        cart_item_params
      )
        super()
        @_chosen_product = chosen_product
        @_cart_item_params = cart_item_params
      end

      def build
        # @chosen_product = Product.find_by product_id: @_product_id
        @cart_item = CartItem.create @_cart_item_params
      end

      def create
        result = @_chosen_product.cart_items << @cart_item
        unless result
        fail!(
          :invalid,
          @user.errors.full_messages.join(", ")
        ) 
        end
      end

    end
  end
end