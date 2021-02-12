class SessionsController < ApplicationController
    def new

    end

    def create
        # byebug
        @passenger = Passenger.find_by(username: params[:username])
        if @passenger.password == params[:password]
            session[:passenger_id] = @passenger.id
            redirect_to passenger_path(@passenger)
        else
            flash[:error] = @passenger.errors.full_messages
            redirect_to '/'
        end
    end

    def destroy
        session.delete :passenger_id
        redirect_to '/'
    end

end
