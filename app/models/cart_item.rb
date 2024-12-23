class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :item

  validates :quantity, presence: true
  validates :total, presence: true

  before_save :set_total_cost

  def set_total_cost
    price_per_unit = quantity * item.price

    if item.weight?
      price_per_unit = quantity / item.unit_weight
    end

    self.total = price_per_unit
  end
end
