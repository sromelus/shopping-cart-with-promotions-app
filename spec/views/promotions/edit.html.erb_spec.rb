require 'rails_helper'

RSpec.describe "promotions/edit", type: :view do
  let(:promotion) {
    Promotion.create!(
      status: 1,
      type: "",
      quantity: 1,
      get_quantity: 1,
      percent_off: 1,
      category_id: 1
    )
  }

  before(:each) do
    assign(:promotion, promotion)
  end

 xit "renders the edit promotion form" do
    render

    assert_select "form[action=?][method=?]", promotion_path(promotion), "post" do
      assert_select "input[name=?]", "promotion[status]"

      assert_select "input[name=?]", "promotion[type]"

      assert_select "input[name=?]", "promotion[quantity]"

      assert_select "input[name=?]", "promotion[get_quantity]"

      assert_select "input[name=?]", "promotion[percent_off]"

      assert_select "input[name=?]", "promotion[category_id]"
    end
  end
end
