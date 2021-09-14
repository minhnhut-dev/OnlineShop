class CartsController < ApplicationController
    before_action :initialize_session
    before_action :load_cart, only: [:index]
    require_relative "#{Rails.root}/app/models/cart"
    def index
    end

    def add_to_cart
        cart = session[:cart]
        id = params[:id].to_i
        Cart.cart(id,cart)
        redirect_to carts_url
    end

    def load_cart      
        @cart = session[:cart]
    end

    def remove_from_cart
        id = params[:id].to_i
        @cart = session[:cart]
        @cart.delete_if { |product| product["id"] == id}
        redirect_to carts_url
    end

    protected

    def initialize_session
        session[:cart] ||= []
    end
end
