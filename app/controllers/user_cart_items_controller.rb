class UserCartItemsController < ApplicationController
  def index
    @cart_items = current_user_cart.cart_items.includes(:item, item: [:brand, :category])
  end

  def show
  end

  def update
  end

  def empty
  end

  def checkout
  end

  def create
    @cart_item = current_user_cart.cart_items.build(item_id: params[:item_id])

    if @cart_item.save
      redirect_back(fallback_location: root_path, notice: 'Item added to cart')
    else
      redirect_back(fallback_location: root_path, alert: 'Unable to add item to cart')
    end
  end

  def destroy
    @cart_item = current_user_cart.cart_items.find_by(item_id: params[:item_id])
    @cart_item.destroy
    redirect_back(fallback_location: root_path, notice: 'Item removed from cart')
  end
end
