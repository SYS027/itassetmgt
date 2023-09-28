class RemoveAssetTableAndAddAssetToAssignAssets < ActiveRecord::Migration[7.0]
  def change
    # First, remove the existing foreign key constraint
    remove_reference :assign_assets, :asset_table, null: false, foreign_key: true

    # Add a new 'asset_id' column with the UUID data type
    add_column :assign_assets, :asset_id, :uuid

    # Add a foreign key constraint to the 'asset' table
    add_foreign_key :assign_assets, :assets, column: :asset_id, on_delete: :cascade
  end
end
