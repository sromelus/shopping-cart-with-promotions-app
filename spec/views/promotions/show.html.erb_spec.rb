require 'rails_helper'

RSpec.describe "promotions/show", type: :view do
  before(:each) do
    assign(:promotion, Promotion.create!(
      status: 2,
      type: "Type",
      quantity: 3,
      get_quantity: 4,
      percent_off: 5,
      category_id: 6
    ))
  end

  xit "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Type/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/6/)
  end
end
