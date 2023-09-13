class Location < ApplicationRecord
  has_many :employees
  # belongs_to :company
  has_many :assets

  # validates  :office_name, :poc_name, :poc_email, :poc_contact, :zip_code, presence: true
  # validates :zip_code, uniqueness: true
  # validates :is_active, inclusion: { in: [true, false] }
  belongs_to :state
  belongs_to :city
  belongs_to :country
end
