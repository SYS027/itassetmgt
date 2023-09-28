class RemoveAssetTableAndAddAssetToAssignAssets < ActiveRecord::Migration[7.0]
  def change
    # First, remove the existing foreign key constraint
    remove_reference :assign_assets, :asset_table, null: false, foreign_key: true

    # Change the data type of 'asset_id' to UUID
    change_column :assign_assets, :asset_id, :uuid

    # Add the new foreign key constraint to 'asset'
    add_reference :assign_assets, :asset, null: false, foreign_key: true
  end
end
