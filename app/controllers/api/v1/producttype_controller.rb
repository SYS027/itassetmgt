class Api::V1::ProducttypeController < ApplicationController
  def index
    @product_type=ProductType.all
    render json: @product_type
  end

  def show
    render json: @product_type
  end

  def create
    @product_type = ProductType.new(product_type_params)

    if @product_type.save
      render json: { message: 'Product type created successfully.', data: @product_type }, status: :created
    else
      render json: { error: 'Failed to create product type.', errors: @product_type.errors }, status: :unprocessable_entity
    end
  end
end

