class Api::V1::CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def create
    @company = Company.new(company_params)
    @company.admin_id = current_admin_id 

    if @company.save
      render json: @company, status: :created
    else
      render json: { errors: @company.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def company_params
    params.require(:company).permit(:name, :email, :contact_number, :portal_name, :industry, :number_of_employees, :tax_information, :country_id, :state_id, :city_id, :pin_code, :address, :logo)
  end
  
  def current_admin_id
    # Assuming you can access the current admin using admin.current
    # Replace 'Admin' with the actual model name for admin users
    admin = Admin.current
    return admin.id if admin.present?
    # Handle the case where there is no current admin
    # You can return nil or handle it as needed
    # For simplicity, I'll return nil here.
    nil
  end
  
end
