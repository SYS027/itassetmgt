class Api::V1::TotalVendorsController < ApplicationController
  def index
    counts =Vendor.count
    render json: counts
  end
end

