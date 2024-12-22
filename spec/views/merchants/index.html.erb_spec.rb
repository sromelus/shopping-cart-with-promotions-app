require 'rails_helper'

RSpec.describe "merchants/index", type: :view do
  before(:each) do
    assign(:merchants, [
      Merchant.create!(
        name: "Name"
      ),
      Merchant.create!(
        name: "Name1"
      )
    ])
  end

  it "renders a list of merchants" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
  end
end
