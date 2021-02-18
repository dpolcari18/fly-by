require 'pry'
class FlightsController < ApplicationController

    def index
        @sorted_flights = Flight.upcoming_flights
        @flights= Kaminari.paginate_array(@sorted_flights).page(params[:page]).per(15)
    end

end
