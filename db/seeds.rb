# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end



5.times do |n|
  Merchant.find_or_create_by!(name: "Merchant #{n}")
end

5.times do |n|
  Brand.find_or_create_by!(name: "Brand #{n}")
end

5.times do |n|
  Category.find_or_create_by!(name: "Category #{n}")
end

# 5.times do |n|
#   Item.find_or_create_by!(name: "Item #{n}", weight: 10, price: 10, stock_quantity: 10, merchant_id: 1)
# end
