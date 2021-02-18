class ApplicationController < ActionController::Base
    helper_method :logged_in?
    helper_method :employee_logged_in?
    before_action :current_passenger, only: [:logged_in?, :require_logged_in]
    before_action :current_employee, only: [:employee_logged_in?, :require_employee_logged_in]

    helper_method :company_logo, :company_twitter

    def current_passenger
        @passenger = (Passenger.find_by(id: session[:passenger_id]) || Passenger.new)
    end

    def logged_in?
        current_passenger.id != nil
    end

    def require_logged_in
        return redirect_to(controller: 'sessions', action: 'new') unless logged_in?
    end

    def current_employee
        @employee = (Employee.find_by(id: session[:employee_id]) || Employee.new)
    end

    def employee_logged_in?
        current_employee.id != nil
    end

    def require_employee_logged_in
        redirect_to(controller: 'sessions', action: 'new') unless employee_logged_in?
    end

    def company_logo
        airline = Airline.find_by(id: session[:employee_id])
        case airline.name
        when "United"
            "united.jpg"
        when "Delta"
            "delta.jpg"
        when "Southwest"
            "southwest.jpg"
        when "American"
            "american.jpg"
        when "Alaska"
            "alaska.jpg"
        end
    end

    def company_twitter
        airline = Airline.find_by(id: session[:employee_id])
        airline.twitter
    end
end
