class Api::V1::DepartmentsController < ApplicationController
  before_action :set_department, only: [:show, :update, :destroy]

  def index
    @departments = Department.all
    render json: @departments
  end

  def show
    render json: @department
  end

  def create
    @department = Department.new(department_params)
    last_company = Company.last
    @department.company_id = last_company.id if last_company
    
    if @department.save
      render json: { message: 'Department created successfully.', data: @department }, status: :created
    else
      render json: { error: 'Failed to create department.', errors: @department.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @department.update(department_params)
      render json: @department
    else
      render json: { error: 'Failed to update department.', errors: @department.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @department.destroy
    head :no_content
  end

  private
  def set_department
    @department = Department.find(params[:id])
  end

  def department_params
    params.require(:department).permit(:department_name, :contact_person_name, :contact_person_email, :contact_person_phone, :status,:company_id)
  end
end

