class ApplicationController < ActionController::Base
    helper_method :logged_in?
    before_action :current_passenger

    def current_passenger
        @passenger = (Passenger.find_by(id: session[:passenger_id]) || Passenger.new)
    end

    def logged_in?
        current_passenger.id != nil
    end

    def require_logged_in
        return redirect_to(controller: 'sessions', action: 'new') unless logged_in?
    end
end
