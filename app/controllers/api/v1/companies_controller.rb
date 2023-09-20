class Api::V1::CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def create
    @company = Company.new(company_params)
    @company.admin_id = current_admin_id # Set the admin_id to the current admin's ID

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
    # Assuming you store the admin's ID in the authentication token
    # Replace 'YOUR_AUTH_TOKEN_KEY' with the actual key used in your token
    token = request.headers['Authorization']
    if token.present?
      decoded_token = JWT.decode(token, 'YOUR_SECRET_KEY', true, algorithm: 'HS256')
      admin_id = decoded_token[0]['admin_id']
      return admin_id
    else
      # Handle the case where there is no token or it's invalid
      # You can return an error, raise an exception, or handle it as needed
      # For simplicity, I'll return nil here.
      return nil
    end
  end
  
end
