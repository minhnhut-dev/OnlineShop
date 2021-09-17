class Cart 
    # attr_accessor :id
    def initialize(cart)
        @cart= cart
    end
    def add_to_cart(id,qty)
        sub_total = 0
        if @cart.blank? 
            @product = Product.find(id)
            @product = @product.attributes
            @product['qty'] = qty
            @product ["sub_total"] =  @product['qty'].to_i * @product['price'].to_i
        else
                @cart = @cart.each do |product|
                    if product["id"]== id
                        product["qty"] = product["qty"].to_i + qty 
                        product ["sub_total"] =  product['qty'].to_i * product['price'].to_i
                    end
                end
                @product = Product.find(id)
                @product = @product.attributes
                @product['qty'] = qty
                @product ["sub_total"] =  @product['qty'].to_i * @product['price'].to_i
            unless @cart.any? {|h| h["id"] == @product["id"] }
                @cart << @product
              end
        end
         data = @cart.present? ? @cart : [@product]
         @cart = data
      end
      
      def remove_from_cart(id)
        @cart.delete_if {|product| product["id"]==id}
      end
end
