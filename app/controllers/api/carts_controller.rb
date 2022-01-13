class Api::CartsController < ApplicationController
  def update_cart
    @Cart = Cart.new(session[:cart]).update_quantity(params[:id].to_i, params[:quantity].to_i)
    render json:{ 
      data: @Cart,
     }
  end
end
