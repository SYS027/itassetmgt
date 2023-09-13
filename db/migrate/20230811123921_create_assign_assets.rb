class CreateAssignAssets < ActiveRecord::Migration[7.0]
  def change
    create_table :assign_assets do |t|
      t.references :company, null: false, foreign_key: true
      t.references :product_category, null: false, foreign_key: true
      t.references :product_type, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.references :vendor, null: false, foreign_key: true
      t.string :address
      t.references :asset_table, null: false, foreign_key: true
      t.references :department, null: false, foreign_key: true
      t.references :employee, null: false, foreign_key: true
      t.string :Discription
      t.string :Assign_Component
      t.boolean :is_active
      t.timestamps
    end

  end

end