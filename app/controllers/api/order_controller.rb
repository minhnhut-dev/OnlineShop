class Api::OrderController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :initialize_session
  def create_order
    @lineItem= session[:cart]
    @total= @lineItem.inject(0) {|sum, e| sum += e["sub_total"].to_i}
    @order = Order.new(order_params)
    @order.total = @total
    if @order.save
      @lineItem.each do |item|
          @order_details = OrderDetail.new(order_detail_params)
          @order_details.order_id = @order.id
          @order_details.product_id = item['id']
          @order_details.quantity = item['qty']
          @order_details.unitprice = item['price']
          @order_details.intomoney = item['price'].to_i * item['qty'].to_i
          @order_details.save
      end
      session[:cart].clear
      session[:order] = @order
      render json: {
        data: @order
      }, status: 200
    else
      render json: { 
        message: "Create order failed"
      }, status: 500
    end
  end

  private

  def order_params
    params.permit(:user_id, :payment_id, :total, :orderdate, :order_status_id).merge(order_status_id: 1, orderdate: DateTime.now)
  end

  def order_detail_params
    params.permit(:product_id, :order_id, :quantity, :unitprice, :intomoney)
  end

  protected

  def initialize_session  
    session[:order] ||= []
  end
end
