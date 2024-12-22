require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe 'validations' do
    let!(:merchant) { create(:merchant) }

    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_length_of(:name).is_at_least(3).is_at_most(100) }
  end
end
