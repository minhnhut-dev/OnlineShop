class OrderDetail < ApplicationRecord
  belongs_to :product
  belongs_to :order
  scope :getOrderDetailByOrder, ->(order_id) { where('order_id = ?', order_id) }
end
