class OrderController < ApplicationController
  def index
     order_id = (session[:order]["id"])
     @order = Order.find(order_id).order_details
  end
end
