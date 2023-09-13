class Api::V1::AssetSpecificationController < ApplicationController
    def index
        asset_specifications =  AssetSpecification.all
        rendor json: asset_specifications
    end
end

