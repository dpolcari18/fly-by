class Flight < ApplicationRecord
  searchkick
  
  belongs_to :airline
  has_many :tickets
  has_many :passengers, through: :tickets

  before_create :update_price

  def remaining_seats
    (self.number_of_seats)-(self.tickets.count)
  end

  def seats_sold
    (self.tickets.count)
  end

  def revenue
    ((self.seats_sold * self.price)/(self.number_of_seats * self.price)*100).round(2)
  end

  def update_price
    if self.departure.wday == 5 or self.departure.wday == 6
      if self.departure.strftime("%P") == "AM"
        self.price += 150
      else
        self.price += 100
      end
    else
      if self.departure.strftime("%P") == "AM"
        self.price += 50
      else
        self.price
      end
    end
  end

  def flight_hours
    (self.arrival - self.departure)/3600
  end

  def self.upcoming_flights
    self.sort_flights.select {|flight| flight.departure >= Time.now }
  end

  def self.sort_flights
    Flight.all.sort_by {|flight| flight.departure}
  end

end

