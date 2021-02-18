class Employee < ApplicationRecord
  belongs_to :airline

  def tenure
    ((Time.now - self.created_at)/86400).to_i
  end

  def next_flight
    self.airline.flights.upcoming_flights.first
  end

  def time_until_next_departure
    ((self.next_flight.departure - Time.now)/3600).to_i
  end

  def profile_picture 
    (src="#{self.name.downcase}.jpg")
  end
end
