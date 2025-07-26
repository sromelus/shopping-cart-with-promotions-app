module Discounts
  class FlatFeeDiscountService
    def initialize(cart)
      @cart = cart
    end

    def apply
      cart_items = eligible_cart_items
      return if cart_items.empty?

      best_cart_item = find_best_discount_candidate(cart_items)
      apply_discount_to_item(best_cart_item)
      remove_discounts_from_other_items(cart_items, best_cart_item)
    end

    private

    attr_reader :cart

    def eligible_cart_items
      cart.cart_items.joins(:item, item: :promotion)
          .where(promotions: { discount_type: :flat_fee_discount })
    end

    def find_best_discount_candidate(cart_items)
      best_item = nil
      max_savings = 0

      cart_items.each do |cart_item|
        potential_savings = [ cart_item.item.promotion.quantity, cart_item.total ].min

        if potential_savings > max_savings
          max_savings = potential_savings
          best_item = cart_item
        end
      end

      best_item
    end

    def apply_discount_to_item(cart_item)
      discount_amount = cart_item.item.promotion.quantity
      discount_calc = cart_item.total - discount_amount
      cart_item.promotional_total = discount_calc > 0 ? discount_calc : 0
      cart_item.save
    end

    def remove_discounts_from_other_items(cart_items, winning_item)
      other_items = cart_items.where.not(id: winning_item.id)
      other_items.update_all(promotional_total: nil)
    end
  end
end
