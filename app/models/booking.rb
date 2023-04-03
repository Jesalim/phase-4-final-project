class Booking < ApplicationRecord
    belongs_to :flight
     has_many :passengers
    belongs_to :user
  
    validates :flight_id, presence: true
    validates :user_id, presence: true
    validates :booking_number, presence: true
    validates :amount, presence: true
    validates :paid, presence: true
    
end
