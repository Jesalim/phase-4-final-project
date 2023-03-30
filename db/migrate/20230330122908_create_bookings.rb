class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.integer :flight_id
      t.integer :user_id
      t.string :booking_number
      t.decimal :amount
      t.boolean :paid

      t.timestamps
    end
  end
end
