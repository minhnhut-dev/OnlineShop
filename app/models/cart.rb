class Cart 
    def self.cart(id,cart)
        @cart=cart
        if @cart.blank? 
            @product = Product.find(id)
            @product = @product.attributes
            @product['qty'] = 1
        else
            @check=true
                @cart = @cart.each do |product|
                    if product["id"]== id
                        product["qty"] = product["qty"].to_i + 1 
                        @check= false 
                    end
                end
            @product = Product.find(id)
            @product = @product.attributes
            @product['qty']=1         
            @cart << @product unless @check ==false
        end
         data = @cart.present? ? @cart : [@product]
         cart = data
      end
end