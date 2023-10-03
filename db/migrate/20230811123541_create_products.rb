class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :products do |t|
      t.references :company, null: false, foreign_key: true
      t.integer :product_id
      t.integer :product_category_id
      t.integer :product_type_id
      t.string :product_name
      t.string :manufacturer
      t.boolean :is_active

      t.timestamps
    end
  end
end
