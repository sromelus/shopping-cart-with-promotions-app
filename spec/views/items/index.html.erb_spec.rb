require 'rails_helper'

RSpec.describe "items/index", type: :view do
  before(:each) do
    assign(:items, [
      Item.create!(
        name: "Name",
        sold_by: 0,
        unit_weight: 0,
        price: "9.99",
        merchant: nil,
        brand: nil,
        category: nil
      ),
      Item.create!(
        name: "Name",
        sold_by: 0,
        unit_weight: 0,
        price: "9.99",
        merchant: nil,
        brand: nil,
        category: nil
      )
    ])
  end

  it "renders a list of items" do
    render
    cell_selector = 'div>p'
    # assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    # assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    # assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
    # assert_select cell_selector, text: Regexp.new("9.99".to_s), count: 2
    # assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    # assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    # assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
