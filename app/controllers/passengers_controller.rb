class PassengersController < ApplicationController

    def show 
        @passenger = Passenger.find_by(id: params[:id])
    end


end

