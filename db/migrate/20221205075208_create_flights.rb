class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.string :destination
      t.string :departure
      t.string :flight_date
      t.string :return_date

      t.timestamps
    end
  end
end
