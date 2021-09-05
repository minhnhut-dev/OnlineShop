class HomeController < ApplicationController
    def index
        @products=Product.all
    end
    
    def show
        @product_detail = Product.find(params[:id])
    end
end
