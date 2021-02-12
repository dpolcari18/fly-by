class TicketsController < ApplicationController
    def show
        @ticket = Ticket.find_by(id: params[:id])
    end
end
