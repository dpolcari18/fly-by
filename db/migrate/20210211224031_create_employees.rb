class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.references :airline, null: false, foreign_key: true
      t.string :name
      t.string :username
      t.string :password

      t.timestamps
    end
  end
end
