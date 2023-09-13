class CreateProductCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :product_categories do |t|
      t.integer :product_category_id
      t.string :category_name
      t.boolean :is_active

      t.timestamps
    end
  end
end
