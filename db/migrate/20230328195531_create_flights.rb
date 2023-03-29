class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.string :destination
      t.string :departure
      t.date :flight_date
      t.date :return_date
      t.integer :user_id

      t.timestamps
    end
  end
end
