class TicketsController < ApplicationController

    before_action :require_logged_in, only: [:show,:edit, :update, :destroy]
    before_action :find_ticket, only: [:show,:edit, :update, :destroy, :authenticate_passenger]
    before_action :authenticate_passenger, only: [:show, :edit, :update, :destroy]

    def show
    end

    def edit
    end

    def update

    end

    def destroy
        @ticket.destroy
    end

    private

    def find_ticket
        @ticket = Ticket.find_by(id: params[:id])
    end

    def authenticate_passenger
        unless session[:passenger_id] == @ticket.passenger_id
            redirect_to passenger_path(session[:passenger_id])
        end
    end

end
