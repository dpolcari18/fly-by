class SessionsController < ApplicationController
    def new
    end

    def create
        if @passenger = Passenger.find_by(username: params[:username])
            if @passenger.password == params[:password]
                session[:passenger_id] = @passenger.id
                @passenger.tickets.each do |ticket|
                    ticket.change_ticket_status
                end
                redirect_to passenger_path(@passenger)
            else
                flash[:error] = "This password doesn't match"
                redirect_to '/'
            end
        elsif @employee = Employee.find_by(username: params[:username])
            if @employee.password == params[:password]
                session[:employee_id] = @employee.id
                redirect_to employee_path(@employee)
            else
                flash[:error] = "This password doesn't match"
                redirect_to '/'
            end
        else 
            flash[:error] = "This is not a valid username"
            redirect_to '/'
        end
    end

    def destroy
        if session[:passenger_id]
            session.delete :passenger_id
            redirect_to '/'
        else
            session.delete :employee_id
            redirect_to '/'
        end
    end

end
