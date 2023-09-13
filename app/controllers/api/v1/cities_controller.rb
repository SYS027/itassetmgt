class Api::V1::CitiesController < ApplicationController
 
    # ...
    def index
      if params[:country_id] && params[:state_id]
        cities = City.where(country_id: params[:country_id], state_id: params[:state_id])
      else
        cities = City.all
      end
      render json: cities
    end
    # ...

  
    
  def show
    city = City.find(params[:id])
    render json: city
  end
    
  def create
    city = City.new(city_params)
    if city.save
      render json: city, status: :created
    else
      render json: { errors: city.errors }, status: :unprocessable_entity
    end
  end
    
  def update
    city = City.find(params[:id])
    if city.update(city_params)
      render json: city
    else
     render json: { errors: city.errors }, status: :unprocessable_entity
    end
  end
    
  def destroy
    city = City.find(params[:id])
    city.destroy
    head :no_content
  end
    
  private
  def city_params
    params.require(:city).permit(:city_name, :country_id, :state_id)
  end
end

