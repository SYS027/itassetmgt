class Api::V1::AssignAssetsController < ApplicationController
   
  def index
    assign_assets = AssignAsset.all
     assign_assets_array = []
      assign_assets.each do|asset|
           hash1 = asset.as_json.symbolize_keys
          hash2 = {
              vendor_name: asset.vendor.vendor_name,
              department_name: asset.department.department_name,
              asset_name: asset.asset.asset_name,
              assign_to: asset.employee.name
            }
            new_hash = hash1.merge!(hash2)
            assign_assets_array.push(new_hash)
        end
      render json: assign_assets_array
  end

  def show
    assign_asset = AssignAsset.find(params[:id])
     render json: assign_asset
  end

  def create
    assign_asset = AssignAsset.new(assign_asset_params)
    assign_asset.company_id = 1
    if assign_asset.save
      render json: assign_asset, status: :created
    else
      render json: {errors: assign_asset.errors}, status: :unprocessable_entity
    end
  end

  def update
    assign_asset = AssignAsset.find(params[:id])
    if assign_asset.update(assign_asset_params)
      render json: assign_asset
    else
      render json: { errors: assign_asset.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    assign_asset = AssignAsset.find(params[:id])
    if assign_asset.destroy
      head :no_content
    else
      render json: { error: 'Failed to delete the assign asset' }, status: :unprocessable_entity
    end
  end

  private
  def assign_asset_params
    params.require(:assign_asset).permit( :product_category_id, :product_type_id, :product_id, :vendor_id, :address, :asset_id,:department_id,:employee_id,:Description, :Assign_component, :is_active)
  end
end

