class Order < ApplicationRecord
  belongs_to :user
  belongs_to :payment
  belongs_to :order_status
end
