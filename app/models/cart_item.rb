class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :item

  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :total, presence: true, numericality: { greater_than: 0 }

  # def total_cost
  #   item.quantity * item.price
  # end
end
