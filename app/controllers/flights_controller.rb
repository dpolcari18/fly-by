require 'pry'
class FlightsController < ApplicationController
    before_action :require_employee_logged_in, only: [:show]
    before_action :authenticate_employee, only: [:show]    

    def index
        @sorted_flights = Flight.upcoming_flights
        @flights= Kaminari.paginate_array(@sorted_flights).page(params[:page]).per(15)
    end

    def show
        @flight = Flight.find_by(id: params[:id]) 
    end
    
    private

    def authenticate_employee
        unless session[:employee_id] == @employee.id
            redirect_to employee_path(session[:employee_id])
        end
    end
end
