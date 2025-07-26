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

  def display_promotional_price
    return original_price unless promotion

    discounted_price = if promotion.discount_type == "flat_fee_discount"
                        price - promotion.quantity.to_f
                      else
                        price * (1 - promotion.percent_off.to_f / 100)
                      end

    "$#{discounted_price.round(2)}"
  end

  def original_price
    "$#{price.round(2)}"
  end

  def discount_amount
    if promotion.discount_type == "flat_fee_discount"
      promotion.quantity
    elsif promotion.discount_type == "percentage_discount"
      promotion.percent_off
    end
  end
end
