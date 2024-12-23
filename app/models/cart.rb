class Cart < ApplicationRecord
  belongs_to :user

  has_many :cart_items, dependent: :destroy
  has_many :items, through: :cart_items

  validates :total, numericality: { greater_than_or_equal_to: 0.0 }
end

