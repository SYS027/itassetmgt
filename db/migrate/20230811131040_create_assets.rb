class CreateAssets < ActiveRecord::Migration[7.0]
  def change
    create_table :assets do |t|
      t.references :company, null: false, foreign_key: true
      t.references :product_category, null: false, foreign_key: true, type: :uuid
      t.references :product_type, null: false, foreign_key: true, type: :uuid
      t.references :product, null: false, foreign_key: true
      t.string :vendor_references
      t.string :asset_name
      t.integer :price
      t.string :description
      t.references :location, null: false, foreign_key: true
      t.date :purchase_id
      t.date :warranty_expiry_date
      t.references :purchase_type, null: false, foreign_key: true, type: :uuid
      t.references :asset_specification, null: false, foreign_key: true, type: :uuid
      t.boolean :is_active, null: false, default: true

      t.timestamps
    end
  end
end
