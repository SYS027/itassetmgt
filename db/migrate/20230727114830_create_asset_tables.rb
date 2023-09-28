class CreateAssetTables < ActiveRecord::Migration[7.0]
  def up
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :asset_tables, id: :uuid do |t|
      t.references :company, type: :uuid
      t.integer :asset_id
      t.references :product_category, type: :uuid
      t.references :product_type, type: :uuid
      t.integer :product_id
      t.references :vendor, type: :uuid
      t.string :asset_name
      t.integer :price
      t.string :description_id
      t.references :company_location, type: :uuid
      t.date :purchase_date
      t.date :warranty_expiry_date
      t.references :purchase_type, type: :uuid
      t.integer :useful_life
      t.integer :residual_value
      t.integer :description
      t.references :asset_specification, type: :uuid
      t.boolean :is_active

      t.timestamps
    end

    add_foreign_key :asset_tables, :companies, column: :company_id
    add_foreign_key :asset_tables, :product_categories, column: :product_category_id
    add_foreign_key :asset_tables, :product_types, column: :product_type_id
    add_foreign_key :asset_tables, :vendors, column: :vendor_id
    add_foreign_key :asset_tables, :company_locations, column: :company_location_id
    add_foreign_key :asset_tables, :purchase_types, column: :purchase_type_id
    add_foreign_key :asset_tables, :asset_specifications, column: :asset_specification_id
  end

  def down
    drop_table :asset_tables

    disable_extension 'pgcrypto' if extension_enabled?('pgcrypto')
  end
end
