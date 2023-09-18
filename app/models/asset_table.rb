class AssetTable < ApplicationRecord
    has one: companyId
    has one: product_catagory_id
    has one: product_type_id
    has one: product_id
    has one: vendor_id
    has one: purchase_type_id
    has one: company_location_id
    has one: assest_specification_id
end
