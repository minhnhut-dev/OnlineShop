class CartsController < ApplicationController
    before_action :initialize_session
    before_action :load_cart, only: [:index]
    require_relative "#{Rails.root}/app/models/cart"
    def index
    end

    def add_to_cart
        cart = session[:cart]
        id = params[:id].to_i
        @Cart = Cart.new(cart).add_to_cart(id)
        session[:cart] = @Cart
        binding.pry
        redirect_to carts_url
    end

    def load_cart      
        @cart = session[:cart]
    end

    def remove_from_cart
        cart = session[:cart]
        id = params[:id].to_i
        @remove_cart = Cart.new(cart).remove_from_cart(id)
        session[:cart] = @remove_cart
        redirect_to carts_url
    end

    protected

    def initialize_session
        session[:cart] ||= []
    end
end
