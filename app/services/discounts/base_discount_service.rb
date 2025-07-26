module Discounts
    class BaseDiscountService
      def initialize(cart)
        @cart = cart
      end

      def apply
        discount_services.each(&:apply)
      end

      private

      attr_reader :cart

      def discount_services
        [ Discounts::FlatFeeDiscountService.new(cart) ]
      end
    end
end
