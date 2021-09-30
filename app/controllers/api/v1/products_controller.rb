module Api
  module V1
    class ProductsController < ApplicationController

      def index
          products = Product.all
          render json: {status: "Success", message: "Loaded Products", data:products}
      end
      
      def show
          product = Product.find params[:id]
          render json: {status: "Success", message: "Loaded Product", data:product}
      end

      def create 
        product = Product.new(product_params)
        if product.save
          render json: {status: "Success", message: "Product created Successfully", data:product}
        else
          render json: {status: "Error", message: "Product not saved", data:product.errors}
        end
      end

      def destroy
        product = Product.find(params[:id])
        product.destroy
        render json: {status: "Success", message: "Product deleted Successfully", data:product}
      end

      def update
        product = Product.find(params[:id])
        if product.update_attributes(product_params)
          render json: {status: "Success", message: "Product created Successfully", data:product}
        else
          render json: {status: "Error", message: "Not updated", data:product}
        end
      end

      private
      def product_params
        params.permit(:name,:price,:description,:image)
      end
    end
  end
end