

class Ticket < ApplicationRecord
  belongs_to :passenger
  belongs_to :flight

  before_create :create_ticket_number

  private

  def create_ticket_number
    unique_ticket_number = Ticket.all.last.ticket_number += 1
    self.ticket_number = unique_ticket_number
  end
end
