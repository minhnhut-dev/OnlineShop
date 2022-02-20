class Api::CartsController < ApplicationController
  def update_cart
    @cart = Cart.new(session[:cart]).update_quantity(params[:id].to_i, params[:quantity].to_i)
    session[:cart] = @cart
    render json: {
      data: @cart
    }
  end

  def remove_from_cart
    @remove_cart = Cart.new(session[:cart]).remove_from_cart(params[:id].to_i)
    session[:cart] = @remove_cart
    render json: {
      data: @remove_cart
    }
  end
end
