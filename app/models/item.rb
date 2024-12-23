class Item < ApplicationRecord
  belongs_to :merchant, optional: true
  belongs_to :brand, optional: true
  belongs_to :category, optional: true

  belongs_to :promotion, optional: true

  has_many :cart_items
  has_many :carts, through: :cart_items

  validates :name, presence: true, length: { in: 3..50 }
  validates :price, presence: true, numericality: { greater_than: 0 }

  enum sold_by: { quantity: 0, weight: 1 }
  enum unit_weight_label: { pounds: 0, kilograms: 1 }
end
