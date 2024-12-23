require 'rails_helper'

RSpec.describe "items/show", type: :view do
  before(:each) do
    assign(:item, Item.create!(
      name: "Name",
      sold_by: 0,
      unit_weight: 0,
      price: "9.99",
      merchant: nil,
      brand: nil,
      category: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # expect(rendered).to match(/Name/)
    # expect(rendered).to match(/2/)
    # expect(rendered).to match(/3/)
    # expect(rendered).to match(/9.99/)
    # expect(rendered).to match(//)
    # expect(rendered).to match(//)
    # expect(rendered).to match(//)
  end
end
