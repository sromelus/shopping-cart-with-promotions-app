class Promotion < ApplicationRecord
    belongs_to :merchant
    has_many :items

    validates :type, :status, :start_date, :merchant_id, presence: true

    enum type: { flat_fee_discount: 0, percentage_discount: 1, buy_x_get_y_discount: 2, weight_threshold_discount: 3, category_discount: 4 }
    enum status: { active: 0, inactive: 1 }

    validate :flat_fee_discount_validation

    def flat_fee_discount_validation
        if type == 'flat_fee_discount'
            if start_date.nil?
                errors.add(:start_date, 'must be present')
            end
            if merchant_id.nil?
                errors.add(:merchant_id, 'must be present')
            end
            if quantity.nil?
                errors.add(:quantity, 'must be present')
            end
        end
    end
end
