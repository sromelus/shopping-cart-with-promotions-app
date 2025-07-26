class UserCartItemsController < ApplicationController
  def index
    @cart_items = current_user_cart.cart_items.includes(:item, item: [ :brand, :category ])
  end

  def show
  end

  def update
    @cart_item = current_user_cart.cart_items.find(params[:id])
    @cart_item.quantity = params[:quantity]

    if @cart_item.save
      Discounts::BaseDiscountService.new(current_user_cart).apply
      redirect_back(fallback_location: root_path, notice: "Item added to cart")
    else
      redirect_back(fallback_location: root_path, alert: "Unable to add item to cart")
    end
  end

  def empty
  end

  def checkout
  end

  def create
    @cart_item = current_user_cart.cart_items.find_by(item_id: params[:item_id])

    unless @cart_item
      @cart_item = current_user_cart.cart_items.build(item_id: params[:item_id])
    end

    @cart_item.quantity = @cart_item.item.weight? ?  @cart_item.item.unit_weight : @cart_item.quantity + 1

    if @cart_item.save
      Discounts::BaseDiscountService.new(current_user_cart).apply
      redirect_back(fallback_location: root_path, notice: "Item added to cart")
    else
      redirect_back(fallback_location: root_path, alert: "Unable to add item to cart")
    end
  end

  def destroy
    @cart_item = current_user_cart.cart_items.find_by(id: params[:id])
    @cart_item.destroy
    redirect_back(fallback_location: root_path, notice: "Item removed from cart")
  end
end
