FactoryBot.define do
    factory  :product do
        name  {"Áo đỏ"}
        price {1000000}
        category_id {1}
        active {true}
    end
    factory :invalid_product, parent: :product do 
        name {""}
        price {1000000}
        category_id {1}
        active {true}
    end
end
