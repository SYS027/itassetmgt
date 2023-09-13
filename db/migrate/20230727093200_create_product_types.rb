class CreateProductTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :product_types do |t|
      t.integer :product_type_id
      t.string :product_type
      t.boolean :is_active

      t.timestamps
    end
  end
end
