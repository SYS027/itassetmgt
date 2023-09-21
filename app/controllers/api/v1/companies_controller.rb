class Api::V1::CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def create
    @company = Company.new(company_params)

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
end