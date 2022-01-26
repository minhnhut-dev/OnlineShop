class Order < ApplicationRecord
  belongs_to :user
  belongs_to :payment
  belongs_to :order_status
  has_many :order_details
  has_many :product, through: :order_details
end
