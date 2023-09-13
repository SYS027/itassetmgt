class Api::V1::TotalAssetsController < ApplicationController
  def index
    counts =Asset.count
    render json: counts
  end
end

