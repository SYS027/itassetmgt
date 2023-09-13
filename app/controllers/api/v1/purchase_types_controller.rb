class Api::V1::PurchaseTypesController < ApplicationController
  def index
    purchase_types = PurchaseType.all
    render json: purchase_types
  end
     
  def create
    purchase_type = PurchaseType.new(purchase_type_params)
    if @purchase_type.save
      rendor json: purchase_type
    else
      render json: { errors: purchase_type.errors }, status: :unprocessable_entity
    end
  end

  private
  def purchase_type_params
    params.require(:purchase_type).permit(:purchase_type_id, :is_active, :purchase_type)
  end
end

