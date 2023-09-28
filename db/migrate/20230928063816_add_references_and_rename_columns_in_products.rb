class AddReferencesAndRenameColumnsInProducts < ActiveRecord::Migration[7.0]
  def change
    # Add the new references with the correct datatype
    add_reference :products, :product_category, foreign_key: { to_table: :product_categories, type: :uuid }
    add_reference :products, :product_type, foreign_key: { to_table: :product_types, type: :uuid }

    # Rename the columns
    rename_column :products, :Product_Name, :product_name
    rename_column :products, :Manufacturer, :manufacturer
  end
end
