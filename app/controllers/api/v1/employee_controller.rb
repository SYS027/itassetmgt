class Api::V1::EmployeeController < ApplicationController
  def index
    @employees = Employee.all
    employee_array = []
    @employees.each do |employee|
      hash1 = employee.as_json.symbolize_keys
      hash2 = {department: employee.department.department_name , location: employee.location.office_name }
      new_hash = hash1.merge!(hash2)
      employee_array.push(new_hash)
    end
    render json: employee_array
  end

  def total_count
    total_count = Employee.count
    render json: { total_count: total_count }
  end
    
  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      render json: @employee, status: :created
    else
      render json: @employee.errors, status: :unprocessable_entity
    end
  end 

  def show
    @employee = Employee.find(params[:id])
    render json: @employee
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update(employee_params)
     render json: @employee
    else
      render json: @employee.errors, status: :unprocessable_entity
    end
  end
 
  private
  def employee_params
   params.require(:employee).permit(:name, :email, :employee_id, :phone, :location_id, :reporting_manager, :department_id, :status)
  end
end

