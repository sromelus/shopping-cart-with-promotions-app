FactoryBot.define do
  factory :item do
    name { "MyString" }
    sold_by { 1 }
    unit_weight { 1 }
    price { "9.99" }
    merchant { nil }
    brand { nil }
    category { nil }
  end
end
