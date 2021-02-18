class AddTwitterToAirline < ActiveRecord::Migration[6.1]
  def change
    add_column :airlines, :twitter, :string
  end
end
