class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :item

  validates :quantity, presence: true
  validates :total, presence: true

  before_save :set_total_cost

  def set_total_cost
    self.total = quantity * item.price
  end
end
