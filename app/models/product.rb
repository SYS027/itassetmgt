class Product < ApplicationRecord
  belongs_to :company
  belongs_to :product_category
  belongs_to :product_type
  #  belongs_to :company
  has_many :assets
  has_one :assign_assets
end
