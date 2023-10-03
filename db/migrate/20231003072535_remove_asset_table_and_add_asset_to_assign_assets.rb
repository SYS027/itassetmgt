class RemoveAssetTableAndAddAssetToAssignAssets < ActiveRecord::Migration[7.0]
  def change
    # Check if the 'asset_table' foreign key exists before removing it
    if foreign_key_exists?(:assign_assets, :asset_table)
      # First, remove the existing foreign key constraint
      remove_reference :assign_assets, :asset_table, foreign_key: true
    end

    # Add a new 'asset_id' column with the UUID data type
    add_column :assign_assets, :asset_id, type: :uuid

    # Add a foreign key constraint to the 'assets' table
    add_foreign_key :assign_assets, :assets, column: :asset_id
  end
end
