class AssetTable < ApplicationRecord
    has_one :companyId
    has_one :product_catagory_id
    has_one :product_type_id
    has_one :product_id
    has_one :vendor_id
    has_one :purchase_type_id
    has_one :company_location_id
    has_one :assest_specification_id
end
