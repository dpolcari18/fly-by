

class Ticket < ApplicationRecord
  belongs_to :passenger
  belongs_to :flight

  before_create :create_ticket_number

  def change_ticket_status
    if self.flight.arrival < Time.now.to_datetime
      self.update(status: "Closed")
    elsif self.created_at != self.updated_at
      self.update(status: "Changed")
    end
  end
  
  private

  def create_ticket_number
    self.ticket_number = rand(1..9999)
  end
end
