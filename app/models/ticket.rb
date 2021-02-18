

class Ticket < ApplicationRecord
  belongs_to :passenger
  belongs_to :flight

  before_create :create_ticket_number

  validates_uniqueness_of :flight_id, scope: :passenger_id, message: "Error - You cannot purchase more than one ticket per flight"

  def change_ticket_status
    if self.flight.arrival < Time.now.to_datetime
      self.update(status: "Closed")
    elsif self.created_at != self.updated_at
      self.update(status: "Changed")
    end
  end

  def upcoming_flights
    self.sort_flights.select {|flight| flight.departure >= Time.now }
  end

  def sort_flights
    self.sort_by {|flight| flight.departure}
  end
  
  private

  def create_ticket_number
    self.ticket_number = rand(1..9999)
  end
end
