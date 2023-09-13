class Api::V1::TotalcostAssetsController < ApplicationController
    def index
      total_price = Asset.sum(:price)
      render plain: "#{total_price}"
    end
end

