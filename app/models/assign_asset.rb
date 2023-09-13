class AssignAsset < ApplicationRecord
  belongs_to :company
  belongs_to :product_category
  belongs_to :product_type
  belongs_to :product
  belongs_to :vendor
  belongs_to :asset
  belongs_to :department
  belongs_to :employee
end
