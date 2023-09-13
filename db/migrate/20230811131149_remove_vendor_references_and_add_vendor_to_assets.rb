class RemoveVendorReferencesAndAddVendorToAssets < ActiveRecord::Migration[7.0]
  def change
    remove_column :assets, :vendor_references, :string
    add_reference :assets, :vendor, foreign_key: true, null: false
  end
end
