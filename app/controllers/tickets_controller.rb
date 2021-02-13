class TicketsController < ApplicationController
    before_action :require_logged_in, only: [:show,:edit, :update, :destroy, :new, :create]
    before_action :find_ticket, only: [:show,:edit, :update, :destroy, :authenticate_passenger]
    before_action :authenticate_passenger, only: [:show, :edit, :update, :destroy]
    before_action :search, only: [:new, :edit]

    def show
    end

    def new
        @ticket = Ticket.new
    end

    def create
        @ticket = Ticket.new(ticket_params)
        if @ticket.valid?
            @ticket.save
            flash[:update] = "Thank you for purchasing a ticket to #{@ticket.flight.destination}"
            redirect_to ticket_path(@ticket)
        else
            flash[:error] = @ticket.errors.full_messages
            redirect_to new_ticket_path
        end 
    end


    def edit
    end

    def update
        if @ticket.update(ticket_params)
            flash[:update] = "Your ticket has been updated"
            redirect_to ticket_path(@ticket)
        else
            flash[:update] = "Your ticket was not updated"
            redirect_to edit_ticket_path(@ticket)
        end
    end

    def destroy
        @ticket.destroy
        redirect_to passenger_path(session[:passenger_id])
    end
    
    def search
        if params[:origin] != nil
            Flight.reindex
            @flights = Flight.search(params[:origin])  
        else
            @flights = Flight.all
        end
    end
    
    private
    

    def ticket_params
        params.require(:ticket).permit(:flight_id, :passenger_id)
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
