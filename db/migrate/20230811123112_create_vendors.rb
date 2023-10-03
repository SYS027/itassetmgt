class CreateVendors < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :vendors do |t|
      t.references :company, null: false, foreign_key: true
      t.string :vendor_name
      t.string :email
      t.integer :phone_number
      t.references :country, null: false, foreign_key: true
      t.references :state, null: false, foreign_key: true
      t.references :city, null: false, foreign_key: true
      t.integer :zip_code
      t.string :address
      t.string :description
      t.timestamps
    end
  end
end
