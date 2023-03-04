class User < ApplicationRecord
    has_one :verified_user 
    has_secure_password
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true
end
