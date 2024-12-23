json.extract! item, :id, :name, :sold_by, :unit_weight, :price, :merchant_id, :brand_id, :category_id, :created_at, :updated_at
json.url item_url(item, format: :json)
