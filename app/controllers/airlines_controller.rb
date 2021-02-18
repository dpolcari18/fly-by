class AirlinesController < ApplicationController
    def show
        @airline = Airline.find_by(id: params[:id])

        @sorted_flights = @airline.upcoming_flights
        @flights= Kaminari.paginate_array(@sorted_flights).page(params[:page]).per(15)
    end
end
