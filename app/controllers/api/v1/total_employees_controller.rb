class Api::V1::TotalEmployeesController < ApplicationController
  def index
    counts =Employee.count
    render json: counts
  end
end

