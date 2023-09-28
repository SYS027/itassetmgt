class CreateAssetTables < ActiveRecord::Migration[7.0]
  def change
    create_table :asset_tables do |t|
      t.integer :companyId
      t.integer :asset_id
      t.integer :product_catagory_id
      t.integer :product_type_id
      t.integer :product_id
      t.integer :vendor_id
      t.string :asset_name
      t.integer :price
      t.string :description_id
      t.integer :company_location_id
      t.date :purchase_date
      t.date :warranty_expiry_date
      t.integer :purchase_type_id
      t.integer :useful_life
      t.integer :residual_value
      t.integer :description
      t.integer :assest_specification_id
      t.boolean :is_active

      t.timestamps
    end
  end
end