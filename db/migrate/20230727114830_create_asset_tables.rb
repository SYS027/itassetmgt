class CreateAssetTables < ActiveRecord::Migration[7.0]
  def up
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :asset_tables, id: :uuid do |t|
      t.references :company, foreign_key: true, type: :uuid
      t.integer :asset_id
      t.references :product_category, foreign_key: true, type: :uuid
      t.references :product_type, foreign_key: true, type: :uuid
      t.integer :product_id
      t.references :vendor, foreign_key: true, type: :uuid
      t.string :asset_name
      t.integer :price
      t.string :description_id
      t.references :company_location, foreign_key: true, type: :uuid
      t.date :purchase_date
      t.date :warranty_expiry_date
      t.references :purchase_type, foreign_key: true, type: :uuid
      t.integer :useful_life
      t.integer :residual_value
      t.integer :description
      t.references :asset_specification, foreign_key: true, type: :uuid
      t.boolean :is_active

      t.timestamps
    end
  end

  def down
    drop_table :asset_tables

    disable_extension 'pgcrypto' if extension_enabled?('pgcrypto')
  end
end
