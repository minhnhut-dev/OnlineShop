FactoryBot.define do
  factory :category do
    name { "áo" }
    active { true}
  end
  factory :invalid_category, parent: :category do
    name {""}
    active { true}
  end
end