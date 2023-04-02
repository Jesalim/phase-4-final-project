class BookingSerializer < ActiveModel::Serializer
  attributes :id, :flight_id, :booking_number, :amount, :paid

  has_many :passengers
end
