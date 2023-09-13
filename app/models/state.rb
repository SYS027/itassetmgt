class State < ApplicationRecord
belongs_to :country
has_many :cities
has_many :vendors
has_one :companies
has_many :locations

end
