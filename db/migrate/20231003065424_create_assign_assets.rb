class CreateAssignAssets < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :assign_assets, id: :uuid do |t|
      t.references :asset_table, null: false, foreign_key: true
      t.references :company, null: false, foreign_key: true
      t.references :product_category, null: false, foreign_key: true, type: :uuid
      t.references :product_type, null: false, foreign_key: true, type: :uuid
      t.references :product, null: false, foreign_key: true
      t.references :vendor, null: false, foreign_key: true
      t.string :address
      t.references :department, null: false, foreign_key: true, type: :uuid
      t.references :employee, null: false, foreign_key: true,type: :uuid
      t.string :description
      t.string :assign_component
      t.boolean :is_active

      t.timestamps
    end
  end
end
