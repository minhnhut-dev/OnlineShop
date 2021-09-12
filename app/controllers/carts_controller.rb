class CartsController < ApplicationController
    before_action :initialize_session
    before_action :load_cart, only: [:index]
    def index
    end
    def add_to_cart
        id = params[:id].to_i
        #1: Dung 1 bien get thong tin session cart
        @cart =  session[:cart]
        #2: Kiem tra xem id da ton tai trong session cart hay chua
        # Co 2 truong hop cho buoc kiem tra. 1: cart rong, 2: cart co data
        total__price = 0
        if @cart.blank? 
            @product = Product.find(params[:id])
            @product = @product.attributes
            @product['qty']=1
        else
                @cart = @cart.each do |product|
                    if product["id"]== id
                        product["qty"] = product["qty"].to_i + 1  
                    end
                end
                @product = Product.find(params[:id])
                @product = @product.attributes
                @product['qty']=1
                @product['total'] = @product["qty"].to_i * @product["price"].to_i
                @cart << @product unless @cart.include?(id)
                  
        end

        data = @cart.present? ? @cart : [@product]
        session[:cart] = data
        #4: Neu da ton tai thi update quantity += 1
        #5: Gan nguoc tro lai session cart
        binding.pry
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
