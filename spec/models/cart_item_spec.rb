require 'rails_helper'

RSpec.describe CartItem, type: :model do
  describe "validations" do
    it {should belong_to(:cart) }
    it {should belong_to(:item) }
    it {should validate_presence_of(:quantity) }
    it {should validate_presence_of(:total) }
  end
end
