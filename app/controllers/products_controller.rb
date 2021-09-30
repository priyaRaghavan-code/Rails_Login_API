class ProductsController < ApplicationController
    def index
        @category = Category.find(params[:category_id])
        @products = @category.product.includes(:variants).order(:title)
    end
    
    # def show
    #     render json: @product
    # end

    # private 
    # def product_params
    #     params.require(:product).permit(:name,:description,:type,:price,:brand,:available,:department)
    # end

end
