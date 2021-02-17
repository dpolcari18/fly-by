class AddEmailToPassenger < ActiveRecord::Migration[6.1]
  def change
    add_column :passengers, :email, :string
  end
end
