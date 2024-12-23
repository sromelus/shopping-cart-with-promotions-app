class UserCartItemsController < ApplicationController
  def index
    @cart_items = current_user_cart.cart_items.includes(:item, item: [:brand, :category])
  end

  def show
  end

  def update
    @cart_item = current_user_cart.cart_items.find(params[:id])
    @cart_item.quantity = params[:quantity]

    if @cart_item.save
      apply_best_flat_fee_discount
      redirect_back(fallback_location: root_path, notice: 'Item added to cart')
    else
      redirect_back(fallback_location: root_path, alert: 'Unable to add item to cart')
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
      apply_best_flat_fee_discount
      redirect_back(fallback_location: root_path, notice: 'Item added to cart')
    else
      redirect_back(fallback_location: root_path, alert: 'Unable to add item to cart')
    end
  end

  def destroy
    @cart_item = current_user_cart.cart_items.find_by(id: params[:id])
    @cart_item.destroy
    redirect_back(fallback_location: root_path, notice: 'Item removed from cart')
  end


  def apply_best_flat_fee_discount
    cart_items = current_user_cart.cart_items.joins(:item, item: :promotion).where(promotions: { discount_type: :flat_fee_discount })
    return if cart_items.empty?

    discount_cart_item = nil
    min_diff = Float::INFINITY

    cart_items.each do |cart_item|
      diff = cart_item.total - cart_item.item.promotion.quantity

      if diff < min_diff
        min_diff = diff
        discount_cart_item = cart_item
      end
    end

    discount_calc = discount_cart_item.total - discount_cart_item.item.promotion.quantity
    discount_cart_item.promotional_total = discount_calc > 0 ? discount_calc : 0

    non_discounted_cart_items = cart_items.where.not(id: discount_cart_item.id)
    non_discounted_cart_items.update_all(promotional_total: nil)

    discount_cart_item.save
  end
end