class Cart 
    def initialize(cart)
        @cart= cart
    end
    def add_to_cart(id,qty)
        if @cart.blank? 
         product= Cart.find_product(id,qty)
         @cart = [product]
        else
          data= update_cart(id,qty)
          product = Cart.find_product(id, qty)
          unless @cart.any? {|h| h["id"] == product["id"] }
              data << product
          end
          @cart =data
        end
      end

      def self.sub_total(qty,price)
        sub_total = 0
        sub_total = qty.to_i * price.to_i
      end

      def self.find_product(id,qty)
        @product = Product.find(id)
        @product = @product.attributes
        @product['qty'] = qty
        @product ["sub_total"] =  Cart.sub_total(qty, @product["price"])
        return @product
      end

      def total
       return sum = 0 if @cart.blank?
          @cart.inject(0){|sum, e| sum += e["sub_total"].to_i}
      end

      def remove_from_cart(id)
        @cart.delete_if {|product| product["id"] == id}
      end
      
      def update_cart(id,qty)
         @cart.each do |product|
          if product["id"] == id
              product["qty"] = product["qty"].to_i + qty 
              product ["sub_total"] =  Cart.sub_total(product["qty"], product["price"])
          end
        end
      end
    
end
