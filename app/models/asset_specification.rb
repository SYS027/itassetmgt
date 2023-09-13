class AssetSpecification < ApplicationRecord
  belongs_to :company
  has_many :assets

end
