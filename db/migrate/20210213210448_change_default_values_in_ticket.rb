class ChangeDefaultValuesInTicket < ActiveRecord::Migration[6.1]
  def change 
    change_column :tickets, :number_of_bags, :integer, default: 2
    change_column :tickets, :status, :string, default: "Open"
  end
end
