class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :products, id: :uuid do |t|
      t.references :company, null: false, foreign_key: true, type: :uuid
      t.integer :product_id
      t.integer :product_catagory_id
      t.integer :product_type_id
      t.string :Product_Name
      t.string :Manufacturer
      t.boolean :is_active

      t.timestamps
    end
  end
end
