
class Cart
  def initialize(cart)
    @cart = cart
  end
        
  def add_to_cart(id,qty)
    if !@cart.any?{|hash| hash["id"] == id} 
      @cart << find_product(id,qty)
    else
      @cart = update_cart(id,qty)
    end
  end

  def update_quantity(id,qty)
    @cart.each do |product|
      if product["id"] == id
          product["qty"] = qty 
          product ["sub_total"] =  sub_total(product["qty"], product["price"])
      end
    end
  end
    
  def sub_total(qty,price)
    qty.to_i * price.to_i
  end

  def find_product(id,qty)
    @product = Product.find(id)
    @product = @product.attributes
    @product['qty'] = qty
    @product ["sub_total"] = sub_total(qty, @product["price"])
    @product ["total"] = total
    return @product
  end

  def total
    return 0 if @cart.blank?  
    @cart.inject(0) {|sum, e| sum += e["sub_total"].to_i}
  end

  def remove_from_cart(id)
    @cart.delete_if {|product| product["id"] == id}
  end
      
  def update_cart(id,qty)
     @cart.each do |product|
      if product["id"] == id
         product["qty"] = product["qty"].to_i + qty 
         product ["sub_total"] =  sub_total(product["qty"], product["price"])
         product ["total"] = total
      end
    end
  end
end
