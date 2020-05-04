class Landlord < ApplicationRecord
    has_one :user, as: :userable
    has_many :properties
end
