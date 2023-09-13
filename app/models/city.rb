class City < ApplicationRecord
  belongs_to :country
  belongs_to :state
  has_many :vendors
  has_many :locations

end
