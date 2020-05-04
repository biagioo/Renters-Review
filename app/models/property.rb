class Property < ApplicationRecord
    belongs_to :landlord
    has_many :reviews
    has_many :tenants, through: :reviews
end
