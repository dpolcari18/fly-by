

class Ticket < ApplicationRecord
  belongs_to :passenger
  belongs_to :flight

  before_create :create_ticket_number

  private

  def create_ticket_number
    self.ticket_number = rand(1..9999)
  end

  def child_price_cal
    if self.passenger.age > 12
        self.price
      
    elsif self.tickets.passenger.age < 12 && self.tickets.passenger.age > 2
        self.price = (self.price * 0.75)
      
    else self.tickets.passenger.age < 2
        self.price = 0
    end
  end

  def changed_flight
    if self.status == "Exchanged"
      self.status.count
    end
  end



end
