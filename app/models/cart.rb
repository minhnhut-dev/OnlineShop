class Cart 
    # attr_accessor :id
    def initialize(cart)
        @cart= cart
    end
    def add_to_cart(id)
        cart=@cart
        sub_total = 0
        if cart.blank? 
            @product = Product.find(id)
            @product = @product.attributes
            @product['qty'] = 1
            @product ["sub_total"] =  @product['qty'].to_i * @product['price'].to_i
        else
            @check=true
                cart = @cart.each do |product|
                    if product["id"]== id
                        product["qty"] = product["qty"].to_i + 1 
                        product ["sub_total"] =  product['qty'].to_i * product['price'].to_i
                        @check= false 
                    end
                end
                @product = Product.find(id)
                @product = @product.attributes
                @product['qty'] = 1
                @product ["sub_total"] =  @product['qty'].to_i * @product['price'].to_i
            cart << @product unless @check ==false
        end
         data = @cart.present? ? @cart : [@product]
         cart = data
      end
      
      def remove_from_cart(id)
        cart=@cart
        cart.delete_if { |product| product["id"] == id}
      end
end 