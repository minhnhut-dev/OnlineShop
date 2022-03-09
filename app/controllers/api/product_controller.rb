class Api::ProductController < ApplicationController
  def seach_keyword
    array_product = []
    @products = Product.search_autocomplete(params[:keyword])
    @products.each do |product|
      product_inf = product.attributes
      product_inf[:images_path] = url_for(product.image)
      array_product << product_inf
    end
    render json:{
      'data': array_product
     }
  end
end
