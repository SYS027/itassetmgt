class Vendor < ApplicationRecord
  belongs_to :country
  belongs_to :state
  belongs_to :city
  belongs_to :company
  has_many :assets
  has_one :assign_assets
end
