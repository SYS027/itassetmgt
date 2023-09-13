class Api::V1::ProductcategoriesController < ApplicationController
  def index
    @product_categories=ProductCategory.all
    render json: @product_categories
  end
end

