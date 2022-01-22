class OrderController < ApplicationController
  def index
     @order_detail = OrderDetail.getOrderDetailByOrder(session[:order]["id"])
  end
end
