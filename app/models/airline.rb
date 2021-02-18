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

    def revenue
        self.flights.map {|flight| flight.seats_sold * flight.price}.sum
    end

    def average_utilization
        (self.utilization_sum / self.utilization_count).round(2)
    end

    def utilization
        self.flights.map {|flight| (flight.seats_sold.to_f) / (flight.number_of_seats.to_f)*100}
    end

    def utilization_sum
        self.utilization.sum {|i| i}
    end

    def utilization_count
        self.utilization.count
    end
end
