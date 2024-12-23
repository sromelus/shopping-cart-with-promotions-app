class Promotion < ApplicationRecord
    belongs_to :merchant
    has_many :items

    validates :type, :status, :start_date, :merchant_id, presence: true
end
