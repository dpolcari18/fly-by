class SessionsController < ApplicationController
    def new

    end

    def create
        # byebug
        @passenger = Passenger.find_by(username: params[:username])
        session[:passenger_id] = @passenger.id
        redirect_to passenger_path(@passenger)
    end

    def destroy
        session.delete :passenger_id
        redirect_to '/'
    end

end
