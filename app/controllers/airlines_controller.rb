class AirlinesController < ApplicationController
    def show
        @airline = Airline.find_by(id: params[:id])
    end
end
