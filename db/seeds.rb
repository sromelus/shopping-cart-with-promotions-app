# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

#delete all data in the database
Cart.destroy_all
CartItem.destroy_all
Item.destroy_all
Brand.destroy_all
Category.destroy_all
Merchant.destroy_all
User.destroy_all
Promotion.destroy_all


User.create!(name: "Joel")

5.times do |n|
  Merchant.find_or_create_by!(name: "Merchant #{n}")
end

5.times do |n|
  Brand.find_or_create_by!(name: Faker::Commerce.brand)
end

5.times do |n|
  Category.find_or_create_by!(name: Faker::Commerce.department)
end


1.times do |n|
  Promotion.find_or_create_by!(discount_type: 0, start_date: Date.today, merchant_id: Merchant.all.sample.id, quantity: rand(1..10), get_quantity: rand(1..10), percent_off: rand(1..10), category_id: Category.all.sample.id, discount_type_text: 1)
end

1.times do |n|
  Promotion.find_or_create_by!(discount_type: 1, start_date: Date.today, merchant_id: Merchant.all.sample.id, quantity: rand(1..10), get_quantity: rand(1..10), percent_off: rand(1..10), category_id: Category.all.sample.id, discount_type_text: 0)
end

3.times do |n|
  Item.find_or_create_by!(name: Faker::Commerce.product_name, sold_by: 0, price: Faker::Commerce.price, merchant_id: Merchant.all.sample.id, brand_id: Brand.all.sample.id, category_id: Category.all.sample.id, promotion_id: Promotion.find_by(discount_type: 0).id)
end

3.times do |n|
  Item.find_or_create_by!(name: Faker::Food.vegetables, sold_by: 1, unit_weight: 0.35, unit_weight_label: 0, price: Faker::Commerce.price, merchant_id: Merchant.all.sample.id, brand_id: Brand.all.sample.id, category_id: Category.all.sample.id, promotion_id: Promotion.find_by(discount_type: 1).id)
end

