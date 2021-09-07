class CartsController < ApplicationController
    before_action :initialize_session
    before_action :load_cart, only: [:index]
    def index
    end
    def add_to_cart
        id = params[:id].to_i
        session[:cart] << id unless session[:cart].include?(id)
        redirect_to '/carts'
    end
    def load_cart
        @cart = Product.find(session[:cart])
    end
    protected
    def initialize_session
        session[:cart] ||= []
    end
end
