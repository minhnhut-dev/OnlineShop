class CartsController < ApplicationController
    before_action :initialize_session
    before_action :load_cart, only: [:index]
    require_relative "#{Rails.root}/app/models/cart"
    def index
    end

    def add_to_cart
        @Cart = Cart.new(session[:cart]).add_to_cart(params[:id].to_i, params[:quantity].to_i)
        session[:cart] = @Cart
        redirect_to carts_url
    end

    def load_cart      
        @cart = session[:cart]
        @total = Cart.new(@cart).total
    end

    def remove_from_cart
        @remove_cart = Cart.new(session[:cart]).remove_from_cart(params[:id].to_i)
        session[:cart] = @remove_cart
        redirect_to carts_url
    end

    protected

    def initialize_session
        session[:cart] ||= []
    end
end
