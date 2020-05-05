class Tenant < ApplicationRecord
    has_one :user, as: :userable
    has_many :reviews
    has_many :properties, through: :reviews
    validates :first_name,   presence: true
end
