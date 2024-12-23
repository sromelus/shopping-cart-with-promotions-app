class DashboardController < ApplicationController
  def index
    @items = Item.all.includes(:brand, :category)
    # @item_count = @cart.items.count
    # @sold_by = @items.sold_by
    # @brand = @items.brand
    # @category = @items.category


    # @cart.total = @cart.items.sum(:price)
    # @cart_items = current_user.cart_items
    # @cart_total = @cart_items.sum { |item| item.price }
  end
end
