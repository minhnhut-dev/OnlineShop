class Product < ApplicationRecord
    belongs_to :category
    has_many :order, through: :order_details
    has_one_attached :image
    has_many :order_details
end
