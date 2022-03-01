class HomeController < ApplicationController
  def index
    @products = Product.includes(:category, image_attachment: :blob )
  end
end
