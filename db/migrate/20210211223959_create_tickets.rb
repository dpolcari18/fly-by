class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.references :passenger, null: false, foreign_key: true
      t.references :flight, null: false, foreign_key: true
      t.string :status
      t.string :number_of_bags

      t.timestamps
    end
  end
end
