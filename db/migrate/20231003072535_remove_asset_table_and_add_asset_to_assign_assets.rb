class RemoveAssetTableAndAddAssetToAssignAssets < ActiveRecord::Migration[7.0]
  def change
    remove_reference :assign_assets, :asset_table, null: false, foreign_key: true
    add_reference :assign_assets, :asset, null: false, foreign_key: true
  end
end