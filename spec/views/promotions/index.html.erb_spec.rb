require 'rails_helper'

RSpec.describe "promotions/index", type: :view do
  before(:each) do
    assign(:promotions, [
      Promotion.create!(
        status: 2,
        type: "Type",
        quantity: 3,
        get_quantity: 4,
        percent_off: 5,
        category_id: 6
      ),
      Promotion.create!(
        status: 2,
        type: "Type",
        quantity: 3,
        get_quantity: 4,
        percent_off: 5,
        category_id: 6
      )
    ])
  end

  xit "renders a list of promotions" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Type".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(4.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(5.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(6.to_s), count: 2
  end
end
