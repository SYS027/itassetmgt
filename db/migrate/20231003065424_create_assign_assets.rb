class CreateAssignAssets < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :assign_assets do |t|
      t.references :asset_table, null: false, foreign_key: { to_table: :asset_tables, type: :uuid }
      t.references :company, null: false, foreign_key: { to_table: :companies}
      t.references :product_categories_id, null: false, foreign_key: { to_table: :product_categories}
      t.references :product_types_id, null: false, foreign_key: { to_table: :product_types, type: :uuid }
      t.references :product, null: false, foreign_key: { to_table: :products }
      t.references :vendor, null: false, foreign_key: { to_table: :vendors}
      t.string :address
      t.references :department, null: false, foreign_key: { to_table: :departments, type: :uuid }
      t.references :employee, null: false, foreign_key: { to_table: :employees, type: :uuid }
      t.string :description
      t.string :assign_component
      t.boolean :is_active

      t.timestamps
    end
  end
end
