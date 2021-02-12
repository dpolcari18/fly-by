class PassengersController < ApplicationController

    before_action :require_logged_in, only: [:show]
    before_action :find_passenger, only: [:authenticate_passenger, :show]
    before_action :authenticate_passenger, only: [:show]

    def show 
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
    
    def find_passenger
        @passenger = Passenger.find_by(id: params[:id])
    end

    def authenticate_passenger
        unless session[:passenger_id] == @passenger.id
            redirect_to passenger_path(session[:passenger_id])
        end
    end
end

