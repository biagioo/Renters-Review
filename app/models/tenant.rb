class Tenant < ApplicationRecord
    has_one :user, as: :userable
end
