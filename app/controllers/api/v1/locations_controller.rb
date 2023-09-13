class Api::V1::LocationsController < ApplicationController
  def index
    locations=Location.all
    location_array = []
    locations.each do |location|
    hash1 = location.as_json.symbolize_keys
    hash2 = {state: location.state.state_name, city: location.city.city_name}
    new_hash = hash1.merge!(hash2)
    location_array.push(new_hash)
      end
    render json: location_array
  end

  def create
    @location = Location.new(location_params)
  
    last_company = Company.last
    @location.company_id = last_company.id if last_company
  
    if @location.save
      render json: { message: 'Location created successfully.', data: @location }, status: :created
    else
      render json: { error: 'Failed to create Location.', errors: @location.errors }, status: :unprocessable_entity
    end
  end
  
  def update
   location = Location.find(params[:id])
    if location.update(location_params)
      render json: location
    else
      render json: location.errors, status: :unprocessable_entity
    end
  end

  def show
    location = Location.find(params[:id])
    render json: location
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy
    respond_to do |format|
      format.html { redirect_to locations_path, notice: 'Location was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
  def location_params
    params.require(:location).permit( :office_name, :poc_name, :poc_email, :poc_contact, :country_id, :state_id, :city_id, :zip_code, :is_active)
  end
end

