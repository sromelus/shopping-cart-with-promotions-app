class Merchant < ApplicationRecord
    validates :name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 100 }
end
