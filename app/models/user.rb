class User < ApplicationRecord
    belongs_to :userable, polymorphic: true
    has_secure_password
    #validates :email, uniqueness: true
    #validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
   
end
