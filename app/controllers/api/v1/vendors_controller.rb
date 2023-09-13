class Api::V1::VendorsController < ApplicationController
  def index
    vendors = Vendor.all
    render json: vendors
  end

  def total_count
    total_count = Vendor.count
    render json: { total_count: total_count }
  end

  def show
    vendor = Vendor.find(params[:id])
    render json: vendor
  end
  
  def create
    vendor = Vendor.new(vendor_params)
    last_company = Company.last
    
    if last_company
      vendor.company_id = last_company.id
    else
      render json: { errors: ["No companies available to assign to the vendor."] }, status: :unprocessable_entity
      return
    end
    
    if vendor.save
      render json: vendor, status: :created
    else
      render json: { errors: vendor.errors }, status: :unprocessable_entity
    end
  end
  
  def update
    vendor = Vendor.find(params[:id])
    if vendor.update(vendor_params)
      render json: vendor
    else
      render json: { errors: vendor.errors }, status: :unprocessable_entity
    end
  end
  
  def destroy
    vendor = Vendor.find_by(id: params[:id])
    vendor.destroy
    head :no_content
  end
  
  private
  def vendor_params
    params.require(:vendor).permit(:vendor_name, :email, :phone_number, :country_id, :state_id, :city_id, :zip_code, :company_id, :address, :description, :is_active)
  end     
end

