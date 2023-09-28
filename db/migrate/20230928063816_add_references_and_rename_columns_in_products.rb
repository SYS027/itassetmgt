class AddReferencesAndRenameColumnsInProducts < ActiveRecord::Migration[7.0]
  def up
    # Change the datatype of product_category_id to uuid
    # change_column :products, :product_category_id, :uuid, using: 'product_category_id::uuid'

    # Add the new reference with the correct datatype
    add_reference :products, :product_category, foreign_key: { to_table: :product_categories, type: :uuid }
    add_reference :products, :product_type, foreign_key: { to_table: :product_types, type: :uuid }

    # Rename the columns
    rename_column :products, :Product_Name, :product_name
    rename_column :products, :Manufacturer, :manufacturer
  end

  def down
    # Revert the changes in reverse order if needed
    rename_column :products, :manufacturer, :Manufacturer
    rename_column :products, :product_name, :Product_Name

    remove_reference :products, :product_type, foreign_key: true
    remove_reference :products, :product_category, foreign_key: true

    change_column :products, :product_category_id, :bigint
  end
end
