class PassengersController < ApplicationController

    def show 
        @passenger = Passenger.find_by(id: params[:id])
    end

    def new
        @passenger = Passenger.new

    end

    def create
        @passenger = Passenger.new(passenger_params)
        if @passenger.valid?
            @passenger.save
            redirect_to passenger_path(@passenger)
        else
            flash[:error] = @passenger.errors.full_messages
            redirect_to new_passenger_path
        end
    end

    private

    def passenger_params
        params.require(:passenger).permit(:first_name, :last_name, :username, :password, :age)
    end
end

