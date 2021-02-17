class FlightsController < ApplicationController

    def index
        @flights = Flight.upcoming_flights
    end

    def show 
        @flight = Flight.find_by(id: params[:id])
    end

end
