class Airline < ApplicationRecord
    has_many :flights
    has_many :employees


    def Total_Revenue
        avg_rev = Airline.flights.each{|flight|
            flight.map {|f| f.price} }

            (avg_rev.sum * 1.0) / avg.rev.size

    end
end
