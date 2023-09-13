class Api::V1::CountriesController < ApplicationController
  
  def index

    countries = Country.all
    render json: countries, only: [:id, :country_name]
  
  end
    
  def show
    country = Country.find(params[:id])
    render json: country
  end
    
  def create
    country = Country.new(country_params)
    if country.save
      render json: country, status: :created
    else
      render json: { errors: country.errors }, status: :unprocessable_entity
    end
  end
    
  def update
    country = Country.find(params[:id])
      if country.update(country_params)
        render json: country
      else
        render json: { errors: country.errors }, status: :unprocessable_entity
      end
  end
    
  def destroy
    country = Country.find(params[:id])
    country.destroy
    head :no_content
  end

  private
  def country_params
    params.require(:country).permit(:country_name)
  end
end

