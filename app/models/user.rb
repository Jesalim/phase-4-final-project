class User < ApplicationRecord
    has_many :bookings
    has_many :flights
    has_secure_password

    
end
