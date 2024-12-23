require 'rails_helper'

RSpec.describe CartItem, type: :model do
  describe "validations" do
    it { should belong_to(:cart) }
    it { should belong_to(:item) }
    it { should validate_presence_of(:quantity) }
    it { should validate_presence_of(:total) }
  end

  describe 'cart_item total calculation' do
    let(:user) { create(:user) }
    let(:item) { create(:item) }

    context 'sets total successfully' do
      xit 'when sold_by quantity' do
        cart_item = create(:cart_item, cart: user.cart, item: item, quantity: 5)
        expect(cart_item.total).to eq(cart_item.quantity * item.price)
      end

      xit 'when sold_by weight' do
        cart_item = create(:cart_item, cart: user.cart, item: item, quantity: 0.35)
        expect(cart_item.total).to eq(cart_item.quantity * item.price)
      end
    end
  end

  describe 'cart_item total calculation with promotion' do
    let(:user) { create(:user) }
    let(:item) { create(:item) }

    xit 'when promotion is active' do
      promotion = create(:promotion, item: item, type: 'flat_fee_discount', quantity: 5, start_date: Date.today, status: 'active')
      cart_item = create(:cart_item, cart: user.cart, item: item, quantity: 5)
      expect(cart_item.total).to eq(cart_item.quantity * item.price)
    end

    xit 'when promotion is not active' do
      promotion = create(:promotion, item: item, type: 'percentage', discount_percentage: 10)
      cart_item = create(:cart_item, cart: user.cart, item: item, quantity: 5)
      expect(cart_item.total).to eq(cart_item.quantity * item.price)
    end
  end
end
