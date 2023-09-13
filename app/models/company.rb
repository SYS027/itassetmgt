class Company < ApplicationRecord
    # has_one_attached :logo
  belongs_to :country
  belongs_to :state
  belongs_to :city
  has_many :vendors
  has_many :notifications
  has_many :products
  has_many :departments
  has_many :assets
  has_many :asset_specifications
  has_one :assign_assets
  end
  