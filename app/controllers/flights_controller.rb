class FlightsController < ApplicationController

    def index
        @flights = Flight.all
    end

    def show 
        @flight = Flight.find_by(id: params[:id])
    end


    
end
