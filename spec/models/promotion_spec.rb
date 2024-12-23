require 'rails_helper'

RSpec.describe Promotion, type: :model do
  describe 'validation' do
    it { should validate_presence_of(:type) }
    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:merchant_id) }
    it { should belong_to(:merchant) }
  end


end
