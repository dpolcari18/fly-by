class TicketsController < ApplicationController

    before_action :require_logged_in, only: [:show,:edit, :update, :destroy]
    before_action :find_ticket, only: [:show,:edit, :update, :destroy, :authenticate_passenger]
    before_action :authenticate_passenger, only: [:show, :edit, :update, :destroy]

    def show
    end

    def edit
    end

    def update
        if @ticket.update(edit_ticket_params)
            flash[:update] = "Your ticket has been updated"
            redirect_to ticket_path(@ticket)
        else
            flash[:update] = "Your ticket was not updated"
            redirect_to edit_ticket_path(@ticket)
        end
    end

    def destroy
        @ticket.destroy
    end

    private

    def edit_ticket_params
        params.require(:ticket).permit(:flight_id)
    end

    def find_ticket
        @ticket = Ticket.find_by(id: params[:id])
    end

    def authenticate_passenger
        unless session[:passenger_id] == @ticket.passenger_id
            redirect_to passenger_path(session[:passenger_id])
        end
    end

end
