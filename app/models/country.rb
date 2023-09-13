class Country < ApplicationRecord
has_many :states
has_many :cities
has_many :vendors
has_one :companies
has_many :locations

end
