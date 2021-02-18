class Airline < ApplicationRecord
    has_many :flights
    has_many :employees

    def upcoming_flights
        self.sort_flights.select {|flight| flight.departure >= Time.now }
    end

    def sort_flights
        self.flights.sort_by {|flight| flight.departure}
    end

    def get_passengers
        self.flights.map {|flight| flight.passengers}.flatten.uniq
    end
end
