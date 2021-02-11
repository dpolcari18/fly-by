class CreatePassengers < ActiveRecord::Migration[6.1]
  def change
    create_table :passengers do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :password
      t.integer :age

      t.timestamps
    end
  end
end
