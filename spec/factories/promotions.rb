FactoryBot.define do
  factory :promotion do
    status { 1 }
    type { "" }
    start_date { "2024-12-23" }
    end_date { "2024-12-23" }
    quantity { 1 }
    get_quantity { 1 }
    percent_off { 1 }
    category_id { 1 }
  end
end
