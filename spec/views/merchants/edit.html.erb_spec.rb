require 'rails_helper'

RSpec.describe "merchants/edit", type: :view do
  let(:merchant) {
    Merchant.create!(
      name: "MyString"
    )
  }

  before(:each) do
    assign(:merchant, merchant)
  end

  it "renders the edit merchant form" do
    render

    assert_select "form[action=?][method=?]", merchant_path(merchant), "post" do

      assert_select "input[name=?]", "merchant[name]"
    end
  end
end
