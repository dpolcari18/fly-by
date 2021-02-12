class AddTicketNumberToTicket < ActiveRecord::Migration[6.1]
  def change
    add_column :tickets, :ticket_number, :integer
  end
end
