require 'rails_helper'

RSpec.describe Promotion, type: :model do
  describe 'validation' do
    it { should validate_presence_of(:discount_type) }
    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:merchant_id) }
    it { should belong_to(:merchant) }
  end

#  flat fee discount
#   
# + type: “flat_fee_discount”
# + start_date: “2024-12-24”
# + end_date: nil
# + quantity: 10
# + get_quantity: nil

# means $10 off

describe 'flat fee discount' do
  it 'should be valid' do
    promotion = create(:promotion, discount_type: 'flat_fee_discount', start_date: Date.today, merchant: create(:merchant), quantity: 10)
    expect(promotion).to be_valid
  end

  it 'should not be valid without a merchant' do
    promotion = build(:promotion, discount_type: 'flat_fee_discount', start_date: Date.today)
    expect(promotion).not_to be_valid
  end
end


  # Percentage discount
  #   
  # + type: “percentage_discount”
  # + start_date: “2024-12-24”
  # + end_date: nil
  # + quantity: 15
  # + get_quantity: nil

  # means 15% off


  # Buy X Get Y discount
  #   
  # + type: “buy_x_get_y_discount”
  # + start_date: “2024-12-24”
  # + end_date: nil
  # + quantity: 1
  # + get_quantity: 1
  # + percent_off: 100

  # means buy 1 get 1 100% off


  # Buy X Get Y discount
  #   
  # + type: “buy_x_get_y_discount”
  # + start_date: “2024-12-24”
  # + end_date: nil
  # + quantity: 3
  # + get_quantity: 1
  # + percent_off: 50

  # means buy 3 get 1 50% off


  # Weight threshold discounts
  #   
  # + type: “weight_threshold_discount”
  # + start_date: “2024-12-24”
  # + end_date: nil
  # + quantity: 100
  # + get_quantity: nill
  # + percent_off: 50

  # means buy >= 100 weight unit get 50% off


  # Category discount
  #   
  # + type: “category_discount”
  # + start_date: “2024-12-24”
  # + end_date: nil
  # + quantity: nil
  # + get_quantity: nil
  # + percent_off: 50
  # + category_id: 2

  # means 50% off all items in category 2
end
