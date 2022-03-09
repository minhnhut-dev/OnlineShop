class Product < ApplicationRecord
    attr_accessor :image_url
    belongs_to :category
    has_many :order, through: :order_details
    has_one_attached :image
    has_many :order_details
    scope :search_autocomplete, ->(keyword) { where("name LIKE ?", keyword)}
    def self.search_autocomplete(keyword)
        where("name LIKE ?", "%#{keyword}%")
    end
    
end
