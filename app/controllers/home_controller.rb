class HomeController < ApplicationController
    def index
        @products = Product.with_attached_image.all
    end
end
