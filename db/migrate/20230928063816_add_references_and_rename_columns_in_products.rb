class AddReferencesAndRenameColumnsInProducts < ActiveRecord::Migration[7.0]
  def up
    # Remove the existing foreign key constraint
    remove_foreign_key :products, :product_category

    # Change the datatype of product_category_id to uuid
    change_column :products, :product_category_id, :uuid

    # Add the new foreign key constraint with the correct datatype
    add_foreign_key :products, :product_categories, column: :product_category_id, type: :uuid
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

    # Remove the new foreign key constraint
    remove_foreign_key :products, :product_category

    # Change the datatype of product_category_id back to bigint
    change_column :products, :product_category_id, :bigint

    # Add back the original foreign key constraint
    add_foreign_key :products, :product_categories, column: :product_category_id
  end
end
