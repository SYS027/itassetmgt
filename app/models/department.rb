class Department < ApplicationRecord
    has_many :employees
    belongs_to :company
    has_one :assign_assets
end
