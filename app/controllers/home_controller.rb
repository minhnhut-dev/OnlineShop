class HomeController < ApplicationController
    def index
        @products = Product.includes(image_attachment: :blob).all
    end
end
