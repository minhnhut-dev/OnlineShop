class ProductsController < ApplicationController
    def show
        @product_detail = Product.find(params[:id])
    end
end
