class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :item

  validates :quantity, presence: true
  validates :total, presence: true

  before_save :set_total_cost

  def set_total_cost
    total_cost = quantity * item.price

    if item.weight?
      total_cost = (quantity / item.unit_weight) * item.price
    end

    self.total = total_cost
  end
end
