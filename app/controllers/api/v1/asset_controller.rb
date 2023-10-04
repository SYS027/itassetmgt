class Api::V1::AssetController < ApplicationController
  before_action :set_last_company, only: [:create]

  def index
    assets = Asset.all
    assets_array = []
    assets.each do |asset|
      hash1 = asset.as_json.symbolize_keys
      hash2 = {
        vendor_name: asset.vendor.vendor_name,
        product_type_name: asset.product_type.product_type,
        product_name: asset.product.product_name,
      }
      new_hash = hash1.merge!(hash2)
      assets_array.push(new_hash)
    end
    render json: assets_array
  end

  def create
    asset = Asset.new(asset_params)
    asset.company_id = @last_company.company_id
    asset.asset_specification_id = nil
    if asset.save
      render json: asset, status: :created
    else
      render json: { errors: asset.errors }, status: :unprocessable_entity
    end
  end

  def show
    asset = Asset.find(params[:id])
    render json: asset
  end

  def destroy
    asset = Asset.find_by(id: params[:id])
    asset.destroy
    head :no_content
  end

  def update
    asset = Asset.find_by(id: params[:id])
    if asset.update(asset_params)
      render json: asset
    else
      render json: { errors: asset.errors }, status: :unprocessable_entity
    end
  end

  private

  def asset_params
    params.require(:asset).permit(:product_category_id, :product_type_id, :product_id, :vendor_id, :asset_name, :price, :description, :location_id, :purchase_id, :warranty_expiry_date, :purchase_type_id, :is_active, :serial_number)
  end

  def set_last_company
    # Implement logic to set the last company for the user making the request.
    # For example, if you are using Devise:
    @last_company = current_user.last_company
  end
end
