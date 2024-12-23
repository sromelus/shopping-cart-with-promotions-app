require 'rails_helper'

RSpec.describe "promotions/new", type: :view do
  before(:each) do
    assign(:promotion, Promotion.new(
      status: 1,
      type: "",
      quantity: 1,
      get_quantity: 1,
      percent_off: 1,
      category_id: 1
    ))
  end

  xit "renders new promotion form" do
    render

    assert_select "form[action=?][method=?]", promotions_path, "post" do
      assert_select "input[name=?]", "promotion[status]"

      assert_select "input[name=?]", "promotion[type]"

      assert_select "input[name=?]", "promotion[quantity]"

      assert_select "input[name=?]", "promotion[get_quantity]"

      assert_select "input[name=?]", "promotion[percent_off]"

      assert_select "input[name=?]", "promotion[category_id]"
    end
  end
end
