require 'rails_helper'

RSpec.describe Item, type: :model do
  it { should belong_to(:merchant).optional }
  it { should belong_to(:brand).optional }
  it { should belong_to(:category).optional }
  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name).is_at_least(3).is_at_most(50) }
  it { should validate_presence_of(:price) }
  it { should have_db_column(:price).of_type(:decimal) }
  it { should validate_numericality_of(:price).is_greater_than(0) }
  it { should belong_to(:promotion).optional }
end
