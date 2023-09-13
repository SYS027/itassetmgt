class Employee < ApplicationRecord
    belongs_to  :location
    belongs_to  :department
    has_one :assign_assets
end
