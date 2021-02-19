class FlightsController < ApplicationController
    before_action :require_employee_logged_in, only: [:show, :new, :create]
    before_action :find_flight, only: [:show, :destroy, :authenticate_employee]    
    before_action :authenticate_employee, only: [:show, :new, :create]

    def new
        @flight = Flight.new
    end

    def create
        @flight = Flight.new(flight_params)
        if @flight.valid?
            @flight.save
            flash[:notice] = "Thanks for purchasing a flight on #{@flight.airline.name}!"
            redirect_to flight_path(@flight)
        else
            flash[:error] = @flight.errors.full_messages
            redirect_to new_flight_path
        end
    end

    def index
        @sorted_flights = Flight.upcoming_flights
        @flights= Kaminari.paginate_array(@sorted_flights).page(params[:page]).per(15)
    end

    def show
    end

    def destroy
        @flight.destroy
        redirect_to employee_path(session[:employee_id])
    end
    
    private

    def authenticate_employee
        unless session[:employee_id] == @employee.id
            redirect_to employee_path(session[:employee_id])
        end
    end

    def flight_params
        params.require(:flight).permit(:origin, :destination, :departure, :arrival, :price, :number_of_seats, :flight_no, :airline_id)
    end

    def find_flight
        @flight = Flight.find_by(id: params[:id])
    end
end
