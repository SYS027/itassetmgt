
# notification = Notification.create(company_id: 1, notify_id: 1, software_warranty_expiry: "30 days", hardware_warranty_expiry: "30 days", is_active: true)  
# notification = Notification.create(company_id: 1, notify_id: 1, software_warranty_expiry: "60 days", hardware_warranty_expiry: "60 days", is_active: true)  
# notification = Notification.create(company_id: 1, notify_id: 1, software_warranty_expiry: "90 days", hardware_warranty_expiry: "90 days", is_active: true) 

# ProductCategory.create(id:1,category_name:"Hardware")
# ProductCategory.create(id:2,category_name:"Software")
# ProductCategory.create(id:3,category_name:"Cloud Infrastructure")
# ProductCategory.create(id:4,category_name:"Other")

# ProductType.create(id:1,product_type: "Computer")
# ProductType.create(id:2,product_type: "Mobile Devices")
# ProductType.create(id:1,product_type: "Office Accessories")
# ProductType.create(id:1,product_type: "Server")
# ProductType.create(id:1,product_type: "Storage")

# purchase_types=PurchaseType.create(id:1,purchase_type:"Owned",is_active:true)
# purchase_types=PurchaseType.create(id:1,purchase_type:"Rented",is_active:true)
# purchase_types=PurchaseType.create(id:1,purchase_type:"Leased",is_active:true)
# purchase_types=PurchaseType.create(id:1,purchase_type:"Subscription",is_active:true)

require 'csv'

def import_csv_to_table(file_path, table_name, column_names)
  CSV.foreach(file_path, headers: true) do |row|
    values = row.to_h.slice(*column_names.split(','))
    puts "Values to be created: #{values}"
    # You should use 'find_or_create_by' to avoid creating duplicate records
    table_name.constantize.find_or_create_by(values)
  end
end

# Assuming you are in a Ruby on Rails context, you can directly use Rails.root
base_path = Rails.root.join('db', 'country-state-city')
country_file = base_path.join('countries.csv')
state_file = base_path.join('states.csv')
city_file = base_path.join('city.csv')  # Corrected the filename to 'cities.csv'

import_csv_to_table(country_file, 'Country', 'id,country_name,country_id')
import_csv_to_table(state_file, 'State', 'id,state_name,country_id,state_id')
import_csv_to_table(city_file, 'City', 'id,name,country_id,city_id,state_id')
