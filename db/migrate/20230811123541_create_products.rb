class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.references :company, null: false, foreign_key: true
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
