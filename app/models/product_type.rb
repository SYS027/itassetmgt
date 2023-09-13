class ProductType < ApplicationRecord
   has_many :products
   has_many :assets
   has_one :assign_assets
end
