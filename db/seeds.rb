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

5.times do |n|
  Item.find_or_create_by!(name: Faker::Commerce.product_name, sold_by: rand(0..1), unit_weight: rand(0..1), price: Faker::Commerce.price)
end

10.times do |n|
  Item.find_or_create_by!(name: Faker::Commerce.product_name, sold_by: rand(0..1), unit_weight: rand(0..1), price: Faker::Commerce.price, merchant_id: Merchant.all.sample.id, brand_id: Brand.all.sample.id, category_id: Category.all.sample.id)
end


User.first.cart.items << Item.all.sample
User.first.cart.items << Item.all.sample
User.first.cart.items << Item.all.sample
