# dptr=Department.create(department_name: "IT", contact_person_name: "Pankaj", contact_person_email: "pp@gmail.com", contact_person_phone: "98767565434")
AssetSpecification.create(company_id: 3, name: "ff", value: "vffdf", is_active: true)
notification = Notification.create(company_id: 1, notify_id: 1, software_warranty_expiry: "30 days", hardware_warranty_expiry: "30 days", is_active: true)  
notification = Notification.create(company_id: 1, notify_id: 1, software_warranty_expiry: "60 days", hardware_warranty_expiry: "60 days", is_active: true)  
notification = Notification.create(company_id: 1, notify_id: 1, software_warranty_expiry: "90 days", hardware_warranty_expiry: "90 days", is_active: true) 

ProductCategory.create(product_category_id:1,category_name:"Hardware")
ProductCategory.create(product_category_id:2,category_name:"Software")
ProductCategory.create(product_category_id:3,category_name:"Cloud Infrastructure")
ProductCategory.create(product_category_id:4,category_name:"Other")



purchase_types=PurchaseType.create(purchase_type_id:1,purchase_type:"Owned",is_active:true)
purchase_types=PurchaseType.create(purchase_type_id:1,purchase_type:"Rented",is_active:true)
purchase_types=PurchaseType.create(purchase_type_id:1,purchase_type:"Leased",is_active:true)
purchase_types=PurchaseType.create(purchase_type_id:1,purchase_type:"Subscription",is_active:true)

#  AssignAsset.create(company_id: 1, product_category_id: 1, product_type_id: 1, product_id:1, vendor_id:1, address:'cbgfhfh', asset_id: 1, department_id: 1, employee_id: 1, Discription: 'hnfhfyjh', Assign_Component: 'chgfhyf', is_active: 'true')
#  Employee.create(name:"Pavan",email:"pk@test.com",employee_id:"323",phone:"34242e42",reporting_manager: "Aparna",location_id:1, department_id:1)



require 'csv'

def import_csv_to_table(file_path, table_name, column_names)
  CSV.foreach(file_path, headers: true) do |row|
    values = row.to_hash.slice(*column_names.split(','))
    table_name.classify.constantize.create!(values)
  end
end

base_path = Rails.root.join('db', 'country-state-city')
country_file = base_path.join('countries.csv')
state_file = base_path.join('states.csv')
city_file = base_path.join('city.csv')

import_csv_to_table(country_file, 'Country', 'id,country_name,country_id,')
import_csv_to_table(state_file, 'State', 'id,state_name,state_id,country_id,')
import_csv_to_table(city_file, 'City', 'id,city_name,city_id,country_id,state_id,')
