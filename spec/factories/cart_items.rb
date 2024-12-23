FactoryBot.define do
  factory :cart_item do
    quantity { "9.99" }
    total { "9.99" }
    cart { nil }
    item { nil }
  end
end
