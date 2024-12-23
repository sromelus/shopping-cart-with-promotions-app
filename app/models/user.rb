class User < ApplicationRecord
  has_one :cart, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  after_create :create_cart

  def create_cart
    Cart.create!(user: self)
  end
end
