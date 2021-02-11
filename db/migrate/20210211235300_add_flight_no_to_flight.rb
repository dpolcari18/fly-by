class AddFlightNoToFlight < ActiveRecord::Migration[6.1]
  def change
    add_column :flights, :flight_no, :string
  end
end
