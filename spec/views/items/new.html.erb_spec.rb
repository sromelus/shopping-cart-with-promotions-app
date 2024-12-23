require 'rails_helper'

RSpec.describe "items/new", type: :view do
  before(:each) do
    assign(:item, Item.new(
      name: "MyString",
      sold_by: 1,
      unit_weight: 1,
      price: "9.99",
      merchant: nil,
      brand: nil,
      category: nil
    ))
  end

  it "renders new item form" do
    render

    assert_select "form[action=?][method=?]", items_path, "post" do
      assert_select "input[name=?]", "item[name]"

      assert_select "input[name=?]", "item[sold_by]"

      assert_select "input[name=?]", "item[unit_weight]"

      assert_select "input[name=?]", "item[price]"

      assert_select "input[name=?]", "item[merchant_id]"

      assert_select "input[name=?]", "item[brand_id]"

      assert_select "input[name=?]", "item[category_id]"
    end
  end
end
