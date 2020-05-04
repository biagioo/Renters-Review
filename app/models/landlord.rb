class Landlord < ApplicationRecord
    has_one :user, as: :userable
    has_many :properties
    validates :first_name, :last_name,  presence: true
end
