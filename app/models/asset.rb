class Asset < ApplicationRecord
  belongs_to :company
  belongs_to :product_category
  belongs_to :product_type
  belongs_to :product
  belongs_to :location
  belongs_to :purchase_type
  belongs_to :asset_specification, optional: true
  belongs_to :vendor
  has_one :assign_assets
end