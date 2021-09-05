class ProductDetailController < ApplicationController
    def index 
        @product_detail = Product.find(params[:id])
    end
end
