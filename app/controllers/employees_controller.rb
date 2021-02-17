class EmployeesController < ApplicationController
    before_action :require_employee_logged_in, only: [:show]
    before_action :authenticate_employee, only: [:show]
    
    def show
        @employee = Employee.find_by(id: params[:id])
    end

    private

    def authenticate_employee
        unless session[:employee_id] == @employee.id
            redirect_to employee_path(session[:employee_id])
        end
    end
end
