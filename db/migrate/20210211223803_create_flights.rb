class CreateFlights < ActiveRecord::Migration[6.1]
  def change
    create_table :flights do |t|
      t.references :airline, null: false, foreign_key: true
      t.string :origin
      t.string :destination
      t.datetime :departure
      t.datetime :arrival
      t.float :price
      t.integer :number_of_seats

      t.timestamps
    end
  end
end
